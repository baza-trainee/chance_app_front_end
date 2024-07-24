part of 'reminders_bloc.dart';

@freezed
class RemindersEvent with _$RemindersEvent {
  const factory RemindersEvent.loadData() = LoadData;

  const factory RemindersEvent.selectDay(
    DateTime dayDate,
  ) = SelectDay;

  const factory RemindersEvent.addTask(
    TaskModel task,
  ) = AddTask;

  const factory RemindersEvent.taskIsDone(
    TaskModel task,
  ) = TaskIsDone;

  const factory RemindersEvent.taskIsPostponed(
    TaskModel task, {
    required int minutes,
  }) = TaskIsPostponed;

  const factory RemindersEvent.deleteTask(
    TaskModel task,
  ) = DeleteTask;

  const factory RemindersEvent.addMedicine(
    MedicineModel medicine,
  ) = AddMedicine;

  const factory RemindersEvent.medicineIsDone(
    MedicineModel medicine, {
    required DateTime at,
  }) = MedicineIsDone;

  const factory RemindersEvent.medicineIsPostponed(
    MedicineModel medicine, {
    required DateTime doseTime,
    required int minutes,
  }) = MedicineIsPostponed;

  const factory RemindersEvent.deleteMedicine(
    MedicineModel medicine,
  ) = DeleteMedicine;

  const factory RemindersEvent.cancelAll() = CancelAllReminders;
}
