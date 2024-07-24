import 'dart:async';
import 'dart:developer' show log;
import 'dart:ui' show DartPluginRegistrant;

import 'package:chance_app/ux/helpers/reminders_helper.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:flutter/material.dart' show DateTimeRange, DateUtils;
import 'package:flutter_background_service/flutter_background_service.dart';

abstract class BackgroundTasks {
  static const scheduleTasks = "schedule-tasks";
  static const scheduleMedicines = "schedule-medicines";
  static const sendMyLocation = "send-my-location";
}

abstract class BackgroundServiceHelper {
  static Future<void> initialize() async {
    await FlutterBackgroundService().configure(
      iosConfiguration: IosConfiguration(
        onBackground: _onStartIOSBackground,
        onForeground: _onStart,
      ),
      androidConfiguration: AndroidConfiguration(
        onStart: _onStart,
        isForegroundMode: false,
      ),
    );
  }

  static void scheduleReminders() {
    scheduleMedicines();
    scheduleTasks();
  }

  static void scheduleTasks() {
    FlutterBackgroundService().invoke(BackgroundTasks.scheduleTasks);
  }

  static void scheduleMedicines() {
    FlutterBackgroundService().invoke(BackgroundTasks.scheduleMedicines);
  }

  @pragma('vm:entry-point')
  static Future<bool> _onStartIOSBackground(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    service.invoke(BackgroundTasks.scheduleMedicines);
    return true;
  }

  @pragma('vm:entry-point')
  static Future<void> _onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();

    final hiveIsInitialized = await HiveCRUD().initialize();

    await RemindersHelper.initialize();

    _log("Service is started");

    service
      ..on(BackgroundTasks.scheduleTasks).listen((event) async {
        if (!hiveIsInitialized) return; // No access to database
        for (final item in tasksBox.values) {
          if (item.isRemoved) continue;
          await RemindersHelper.addTaskReminder(item);
        }
        _log("Task reminders are scheduled");
      })
      ..on(BackgroundTasks.scheduleMedicines).listen((event) async {
        if (!hiveIsInitialized) return; // No access to database
        for (final item in medicineBox.values) {
          if (item.isRemoved) continue;
          await RemindersHelper.addMedicineReminders(
            item,
            // As medicine event is periodic a date range is required
            dateRange: DateTimeRange(
              start: DateTime.now(),
              end: DateUtils.addDaysToDate(DateTime.now(), 7),
            ),
          );
        }
        _log("Medicine reminders are scheduled");
      });
  }

  //static void runTimer()async {
  //  if (HiveCRUD().setting.isAppShouldSentLocation) {
  //    await Supabase.initialize(
  //      url: supabaseUrl,
  //      anonKey: supabaseAnonKey,
  //    );
  //  }
  //  Timer.periodic(const Duration(seconds: 15), (timer) async {
  //    final status = await Geolocator.checkPermission();
  //    if (status != LocationPermission.denied &&
  //        status != LocationPermission.deniedForever) {
  //      final position = await Geolocator.getCurrentPosition();
  //      await NavigationRepository().sendMyLocation(
  //        position.latitude,
  //        position.longitude,
  //      );
  //    }
  //  });
  //}

  static void _log(String message) => log(message, name: "BackgroundService");
}
