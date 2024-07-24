part of 'reminders_bloc.dart';

@freezed
class RemindersState with _$RemindersState {
  const factory RemindersState.initial({
    required DateTime selectedDay,
    @Default([]) List<TaskModel> tasks,
    @Default([]) List<MedicineModel> medicines,
  }) = _Initial;

  const factory RemindersState.loading({
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = RemindersLoading;

  const factory RemindersState.remindersRefreshed({
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = RemindersRefreshed;

  const factory RemindersState.daySelected({
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = DaySelected;

  const factory RemindersState.taskAdded(
    TaskModel task, {
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = TaskAdded;

  const factory RemindersState.taskDone(
    TaskModel task, {
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = TaskDone;

  const factory RemindersState.taskPostponed(
    TaskModel task, {
    required Duration value,
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = TaskPostponed;

  const factory RemindersState.taskDeleted(
    TaskModel task, {
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = TaskDeleted;

  const factory RemindersState.medicineAdded(
    MedicineModel medicine, {
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = MedicineAdded;

  const factory RemindersState.medicineDone(
    MedicineModel medicine, {
    required DateTime at,
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = MedicineDone;

  const factory RemindersState.medicinePostponed(
    MedicineModel medicine, {
    required Duration value,
    required DateTime doseTime,
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = MedicinePostponed;

  const factory RemindersState.medicineDeleted(
    MedicineModel medicine, {
    required DateTime selectedDay,
    required List<TaskModel> tasks,
    required List<MedicineModel> medicines,
  }) = MedicineDeleted;
}
