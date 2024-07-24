import 'dart:convert';
import 'dart:developer' show log;
import 'dart:io' show Platform;
import 'dart:math' show Random, pow;

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/enum/instruction.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart' show DateTimeRange, DateUtils;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

abstract class RemindersHelper {
  static const categoryId = "reminders";
  static late final Box<Map<dynamic, dynamic>> _configBox;

  static Future<void> initialize({
    void Function(NotificationResponse)? onDidReceiveNotificationResponse,
  }) async {
    _configBox = await Hive.openBox("reminders");
    // Local notifications plugin setup
    await FlutterLocalNotificationsPlugin().initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(kDefaultAndroidIcon),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    // Timezone setup, is required by scheduler
    final currentTimeZone = await FlutterTimezone.getLocalTimezone();
    initializeTimeZones();
    setLocalLocation(getLocation(currentTimeZone));
  }

  /// Requests required permissions.
  static Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      final status = await Permission.scheduleExactAlarm.request();
      return status == PermissionStatus.granted;
    }
    if (Platform.isIOS) {
      final status = await Permission.criticalAlerts.request();
      return status == PermissionStatus.granted ||
          status == PermissionStatus.provisional;
    }
    return true;
  }

  /// Registers new pending notification for the [task].
  static Future<void> addTaskReminder(TaskModel task) async {
    if (task.remindBefore == null) return; // There is no reminder required
    final remindBefore = Duration(minutes: task.remindBefore!);
    final reminderTime = task.date.subtract(remindBefore);
    if (reminderTime.isBefore(DateTime.now())) return;

    final notificationChannel = AndroidNotificationChannel(
      "tasks",
      AppLocalizations.instance.translate("tasks"),
      description: AppLocalizations.instance.translate("taskReminder"),
      enableLights: true,
      ledColor: primary400,
    );
    final notificationConfig = _getNotificationConfig(task.id) ?? {};
    final notificationId = notificationConfig[task.date];

    // Task reminder setup
    final scheduledId = await _scheduleNotification(
      reminderTime,
      androidNotificationChannel: notificationChannel,
      id: notificationId,
      title: task.message,
      body: [
        AppLocalizations.instance.translate("today"),
        Jiffy.parseFromDateTime(task.date.toLocal()).Hm,
      ].join(" "),
      payload: jsonEncode({
        categoryId: "tasks",
        ...task.toJson(),
      }),
    );

    if (scheduledId != notificationId) {
      notificationConfig[task.date] = scheduledId;
      await _updateNotificationConfig(task.id, config: notificationConfig);
    }
  }

  /// Cancels pending notification for the [task].
  static Future<void> cancelTaskReminder(TaskModel task) async {
    final notificationConfig = _getNotificationConfig(task.id);
    final notificationId = notificationConfig?[task.date];
    if (notificationId == null) return;

    await FlutterLocalNotificationsPlugin().cancel(notificationId);
    await _deleteNotificationConfig(task.id);
    _log('"${task.message}" reminder canceled');
  }

  /// Schedules pending notifications for the [medicine] in the [dateRange] range.
  /// [DateTimeRange.end] day is included in scheduled range.
  static Future<void> addMedicineReminders(
    MedicineModel medicine, {
    required DateTimeRange dateRange,
  }) async {
    final endDay = DateUtils.dateOnly(dateRange.end);
    var dayDate = dateRange.start.isAfter(medicine.startDate)
        ? DateUtils.dateOnly(dateRange.start)
        : DateUtils.dateOnly(medicine.startDate);

    while (!dayDate.isAfter(endDay)) {
      for (final timeOffset in medicine.doses.keys) {
        final duration = Duration(minutes: timeOffset);
        await addMedicineReminder(medicine, doseTime: dayDate.add(duration));
      }
      dayDate = DateUtils.addDaysToDate(dayDate, 1);
    }
  }

  /// Registers new pending notification for the [medicine] at the [dateTime].
  static Future<void> addMedicineReminder(
    MedicineModel medicine, {
    required DateTime doseTime,
  }) async {
    final doseCount = medicine.getDoseCountFor(doseTime);
    if (doseCount == null) return;

    final reminderTime = medicine.getActualDoseTime(doseTime);
    if (reminderTime.isBefore(DateTime.now())) return;

    final notificationChannel = AndroidNotificationChannel(
      "medicines",
      AppLocalizations.instance.translate("medicines"),
      description: AppLocalizations.instance.translate("medicineReminder"),
      enableLights: true,
      ledColor: primary400,
    );
    final notificationConfig = _getNotificationConfig(medicine.id) ?? {};
    final notificationId = notificationConfig[reminderTime];
    final reminderText = [
      doseCount,
      medicine.type.toDoseString(doseCount).toLowerCase(),
      AppLocalizations.instance.translate("todayAt").toLowerCase(),
      Jiffy.parseFromDateTime(reminderTime.toLocal()).Hm,
    ].join(' ');
    final shouldShowInstruction = medicine.instruction != Instruction.noMatter;

    // Medicine reminder setup
    final scheduledId = await _scheduleNotification(
      reminderTime,
      androidNotificationChannel: notificationChannel,
      id: notificationId,
      title: medicine.name,
      body: (Platform.isIOS && !shouldShowInstruction)
          ? null
          : [
              if (Platform.isIOS)
                AppLocalizations.instance.translate("accept")
              else
                reminderText,
              if (shouldShowInstruction)
                medicine.instruction.toLocalizedString().toLowerCase(),
            ].join(' '),
      iOSSubtitle: reminderText,
      payload: jsonEncode({
        categoryId: "medicines",
        ...medicine.toJson(),
      }),
    );

    if (scheduledId != notificationId) {
      notificationConfig[reminderTime] = scheduledId;
      await _updateNotificationConfig(medicine.id, config: notificationConfig);
    }
  }

  /// Cancels pending notification for the [medicine] at the [dateTime].
  static Future<void> cancelMedicineReminder(
    MedicineModel medicine, {
    required DateTime doseTime,
  }) async {
    final notificationConfig = _getNotificationConfig(medicine.id) ?? {};
    final reminderTime = medicine.getActualDoseTime(doseTime);
    final notificationId = notificationConfig.remove(reminderTime);
    if (notificationId == null) return;

    await FlutterLocalNotificationsPlugin().cancel(notificationId);
    await _updateNotificationConfig(medicine.id, config: notificationConfig);
    _log('"${medicine.name}" at $reminderTime canceled');
  }

  /// Cancels all pending notification for the [medicine].
  static Future<void> cancelMedicineReminders(MedicineModel medicine) async {
    final notificationConfig = _getNotificationConfig(medicine.id);
    final notificationIds = notificationConfig?.values ?? [];
    for (final notificationId in notificationIds) {
      await FlutterLocalNotificationsPlugin().cancel(notificationId);
    }
    await _deleteNotificationConfig(medicine.id);
    _log('"${medicine.name}" reminders canceled');
  }

  /// Cancels all pending notifications.
  static Future<void> cancelAll() async {
    for (final config in _configBox.values) {
      for (final notificationId in config.values) {
        await FlutterLocalNotificationsPlugin().cancel(notificationId);
      }
    }
    await _configBox.clear();
    _log("All reminders canceled");
  }

  static Map<DateTime, int>? _getNotificationConfig(String id) {
    return _configBox.get(id)?.cast<DateTime, int>();
  }

  static Future<void> _updateNotificationConfig(
    String id, {
    required Map<DateTime, int> config,
  }) {
    return _configBox.put(id, config);
  }

  static Future<void> _deleteNotificationConfig(String id) {
    return _configBox.delete(id);
  }

  static Future<int> _scheduleNotification(
    DateTime dateTime, {
    required AndroidNotificationChannel androidNotificationChannel,
    int? id,
    String? title,
    String? body,
    String? iOSSubtitle,
    String? payload,
  }) async {
    final plugin = FlutterLocalNotificationsPlugin();

    if (Platform.isAndroid) {
      final androidPlugin = plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin
          ?.createNotificationChannel(androidNotificationChannel);
    }

    final pendingNotifications = await plugin.pendingNotificationRequests();
    final notificationIds = pendingNotifications.map((e) => e.id);
    // Check if the notification is already pending
    if (id != null && notificationIds.contains(id)) return id;

    final random = Random();
    final maxValue = pow(2, 31).toInt() - 1;
    int notificationId;

    do {
      notificationId = random.nextInt(maxValue);
    } while (notificationIds.contains(notificationId));

    await plugin.zonedSchedule(
      notificationId, // Must be a unique value
      title,
      body,
      TZDateTime.from(dateTime, local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          importance: Importance.max,
          priority: Priority.max,
          category: AndroidNotificationCategory.reminder,
          groupKey: categoryId,
        ),
        iOS: DarwinNotificationDetails(
          subtitle: iOSSubtitle,
          categoryIdentifier: categoryId,
          interruptionLevel: InterruptionLevel.critical,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
      payload: payload,
    );

    _log('"$title" is scheduled on $dateTime');

    return notificationId;
  }

  static void _log(String message) => log(message, name: "Reminders");
}
