// ignore_for_file: invalid_annotation_target

import 'package:chance_app/ux/enum/instruction.dart';
import 'package:chance_app/ux/enum/medicine_status.dart';
import 'package:chance_app/ux/enum/medicine_type.dart';
import 'package:chance_app/ux/enum/periodicity.dart';
import 'package:chance_app/ux/helpers/date_converter.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show DateUtils, TimeOfDay;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

export 'package:chance_app/ux/enum/medicine_status.dart';

part 'medicine_model.freezed.dart';
part 'medicine_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.medicineModel)
class MedicineModel with _$MedicineModel {
  const factory MedicineModel({
    @HiveField(0) @JsonKey(name: "_id") required String id,
    @HiveField(1) required DateTime updatedAt,
    @HiveField(2) required String name,
    @HiveField(3) required MedicineType type,
    @HiveField(4) required Periodicity periodicity,
    @HiveField(5) @DateConverter() required DateTime startDate,
    @HiveField(6) @Default([]) List<int> weekdays, // if Periodicity.certainDays
    @HiveField(7) required Map<int, int> doses, // offset in min.: dose count
    @HiveField(8) @Default(Instruction.noMatter) Instruction instruction,
    @HiveField(9) @Default([]) List<DateTime> doneAt, // as it's a regular event
    @HiveField(10) @Default({}) Map<DateTime, int> rescheduledOn, // dose: min.
    @HiveField(11) @Default(false) bool isRemoved, // local parameter
  }) = _MedicineModel;

  const MedicineModel._();

  factory MedicineModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineModelFromJson(json);

  /// Checks whether the medicine has planned doses at the [dayDate].
  bool shouldBeTakenAt(DateTime dayDate) {
    for (final entry in rescheduledOn.entries) {
      final date = entry.key.add(Duration(minutes: entry.value)).toLocal();
      if (DateUtils.isSameDay(date, dayDate)) return true;
    }
    dayDate = DateUtils.dateOnly(dayDate); // Ensure it's a date only
    final startDay = DateUtils.dateOnly(startDate);
    final hoursDiff = dayDate.difference(startDay).inHours;
    final isStarted = !hoursDiff.isNegative;
    switch (periodicity) {
      case Periodicity.everyDay:
        return isStarted;
      case Periodicity.inADay:
        return isStarted && (hoursDiff / Duration.hoursPerDay).round().isEven;
      case Periodicity.certainDays:
        return isStarted && weekdays.contains(dayDate.weekday);
    }
  }

  /// Returns dose count if [dateTime] is correct scheduled/rescheduled dose time.
  int? getDoseCountFor(DateTime dateTime) {
    if (!shouldBeTakenAt(dateTime)) return null;
    final time = TimeOfDay.fromDateTime(dateTime);
    return doses[time.toTimeOffset()];
  }

  /// Adds time offset if the dose is rescheduled or returns the same [doseTime] is it isn't.
  DateTime getActualDoseTime(DateTime doseTime) {
    final minutesOffset = rescheduledOn.entries
        .firstWhereOrNull((e) => e.key.isAtSameMomentAs(doseTime))
        ?.value;
    if (minutesOffset == null) return doseTime;
    return doseTime.add(Duration(minutes: minutesOffset));
  }

  /// Returns medicine dose take status.
  MedicineStatus getStatus(DateTime doseTime) {
    if (doneAt.any((date) => date.isAtSameMomentAs(doseTime))) {
      return MedicineStatus.taken;
    }
    final actualTime = getActualDoseTime(doseTime);
    if (actualTime.isBefore(DateTime.now())) return MedicineStatus.missed;
    if (actualTime != doseTime) return MedicineStatus.postponed;
    return MedicineStatus.pending;
  }

  /// Returns whether the medicine dose is done at [doseTime].
  bool isDoneAt(DateTime doseTime) {
    return getStatus(doseTime) == MedicineStatus.taken;
  }
}

extension ToTimeOffset on TimeOfDay {
  int toTimeOffset() => Duration.minutesPerHour * hour + minute;
}

extension ToTimeOfDay on int {
  TimeOfDay toTimeOfDay() => TimeOfDay(
        hour: this ~/ Duration.minutesPerHour,
        minute: this % Duration.minutesPerHour,
      );
}
