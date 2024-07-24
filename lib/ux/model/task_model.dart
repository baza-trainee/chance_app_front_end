// ignore_for_file: invalid_annotation_target

import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.taskModel)
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @HiveField(0) @JsonKey(name: "_id") required String id,
    @HiveField(1) required String message,
    @HiveField(2) required DateTime date,
    @HiveField(3) @Default(false) bool isDone,
    @HiveField(4) int? remindBefore, // in minutes
    @HiveField(5) @Default(false) bool isRemoved, // local parameter
  }) = _TaskModel;

  const TaskModel._();

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  DateTime? get reminderTime {
    if (remindBefore == null) return null;
    return date.subtract(Duration(minutes: remindBefore!));
  }
}
