import 'dart:async';

import 'package:chance_app/ux/helpers/background_service_helper.dart';
import 'package:chance_app/ux/helpers/reminders_helper.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:chance_app/ux/repository/medicine_repository.dart';
import 'package:chance_app/ux/repository/tasks_repository.dart';
import 'package:flutter/material.dart' show DateTimeRange, DateUtils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminders_event.dart';
part 'reminders_state.dart';
part 'reminders_bloc.freezed.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  RemindersBloc()
      : super(
          RemindersState.initial(
            selectedDay: DateUtils.dateOnly(DateTime.now()),
          ),
        ) {
    on<LoadData>(_onLoadData);
    on<SelectDay>(_onSelectedDay);
    // Tasks
    on<AddTask>(_onAddTask);
    on<TaskIsDone>(_onTaskIsDone);
    on<TaskIsPostponed>(_onTaskIsPostponed);
    on<DeleteTask>(_onDeleteTask);
    // Medicines
    on<AddMedicine>(_onAddMedicine);
    on<MedicineIsDone>(_onMedicineIsDone);
    on<MedicineIsPostponed>(_onMedicineIsPostponed);
    on<DeleteMedicine>(_onDeleteMedicine);
    on<CancelAllReminders>(_onCancelAllReminders);
  }

  final _tasksRepository = TasksRepository();
  final _medicineRepository = MedicineRepository();

  Future<void> _onLoadData(LoadData event, Emitter<RemindersState> emit) async {
    emit(
      RemindersLoading(
        selectedDay: state.selectedDay,
        tasks: state.tasks,
        medicines: state.medicines,
      ),
    );
    // Get all IDs of deleted/modified local items
    final syncResults = await Future.wait([
      _tasksRepository.syncTasks(),
      _medicineRepository.syncMedicines(),
    ]);
    // Cancel reminders of the deleted/modified items
    await Future.wait([
      for (final task in state.tasks)
        if (syncResults[0].contains(task.id))
          RemindersHelper.cancelTaskReminder(task),
      for (final medicine in state.medicines)
        if (syncResults[1].contains(medicine.id))
          RemindersHelper.cancelMedicineReminders(medicine),
    ]);
    emit(
      RemindersRefreshed(
        selectedDay: state.selectedDay,
        tasks: List.unmodifiable(_tasksRepository.getLocalTasks()),
        medicines: List.unmodifiable(_medicineRepository.getLocalMedicines()),
      ),
    );
    final permissionGranted = await RemindersHelper.requestPermissions();
    if (permissionGranted) BackgroundServiceHelper.scheduleReminders();
  }

  void _onSelectedDay(SelectDay event, Emitter<RemindersState> emit) {
    emit(
      DaySelected(
        selectedDay: DateUtils.dateOnly(event.dayDate),
        tasks: state.tasks,
        medicines: state.medicines,
      ),
    );
  }

  Future<void> _onAddTask(AddTask event, Emitter<RemindersState> emit) async {
    final task = await _tasksRepository.addTask(event.task);
    await RemindersHelper.addTaskReminder(task);
    emit(
      TaskAdded(
        task,
        selectedDay: state.selectedDay,
        tasks: List.unmodifiable([...state.tasks, task]),
        medicines: state.medicines,
      ),
    );
  }

  Future<void> _onTaskIsDone(
      TaskIsDone event, Emitter<RemindersState> emit) async {
    if (event.task.isDone) return; // Do nothing
    final task = await _tasksRepository.updateTask(
      event.task.copyWith(isDone: true),
    );
    await RemindersHelper.cancelTaskReminder(task);
    emit(
      TaskDone(
        task,
        selectedDay: state.selectedDay,
        tasks: List.unmodifiable([
          for (final item in state.tasks)
            if (item.id == task.id) task else item,
        ]),
        medicines: state.medicines,
      ),
    );
  }

  Future<void> _onTaskIsPostponed(
      TaskIsPostponed event, Emitter<RemindersState> emit) async {
    if (event.task.isDone) return; // Do nothing
    final duration = Duration(minutes: event.minutes);
    final newDate = event.task.date.add(duration);
    final task = await _tasksRepository.updateTask(
      event.task.copyWith(date: newDate),
    );
    await RemindersHelper.cancelTaskReminder(event.task);
    await RemindersHelper.addTaskReminder(task);
    emit(
      TaskPostponed(
        task,
        value: duration,
        selectedDay: state.selectedDay,
        tasks: List.unmodifiable([
          for (final item in state.tasks)
            if (item.id == task.id) task else item,
        ]),
        medicines: state.medicines,
      ),
    );
  }

  Future<void> _onDeleteTask(
      DeleteTask event, Emitter<RemindersState> emit) async {
    final deleted = await _tasksRepository.removeTask(event.task);
    if (!deleted) return;
    await RemindersHelper.cancelTaskReminder(event.task);
    emit(
      TaskDeleted(
        event.task,
        selectedDay: state.selectedDay,
        tasks: List.unmodifiable(
          state.tasks.where((item) => item.id != event.task.id),
        ),
        medicines: state.medicines,
      ),
    );
  }

  Future<void> _onAddMedicine(
      AddMedicine event, Emitter<RemindersState> emit) async {
    final medicine = await _medicineRepository.addMedicine(event.medicine);
    await RemindersHelper.addMedicineReminders(
      medicine,
      // As medicine event is periodic a date range is required
      dateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateUtils.addDaysToDate(DateTime.now(), 7),
      ),
    );
    emit(
      MedicineAdded(
        medicine,
        selectedDay: state.selectedDay,
        tasks: state.tasks,
        medicines: List.unmodifiable([...state.medicines, medicine]),
      ),
    );
  }

  Future<void> _onMedicineIsDone(
      MedicineIsDone event, Emitter<RemindersState> emit) async {
    if (event.medicine.isDoneAt(event.at)) return; // Do nothing
    final medicine = await _medicineRepository.updateMedicine(
      event.medicine.copyWith(
        doneAt: List.unmodifiable({...event.medicine.doneAt, event.at}),
      ),
    );
    await RemindersHelper.cancelMedicineReminder(medicine, doseTime: event.at);
    emit(
      MedicineDone(
        medicine,
        at: event.at,
        selectedDay: state.selectedDay,
        tasks: state.tasks,
        medicines: List.unmodifiable([
          for (final item in state.medicines)
            if (item.id == medicine.id) medicine else item,
        ]),
      ),
    );
  }

  Future<void> _onMedicineIsPostponed(
      MedicineIsPostponed event, Emitter<RemindersState> emit) async {
    if (event.medicine.isDoneAt(event.doseTime)) return; // Do nothing
    final duration = Duration(minutes: event.minutes);
    final doseTime = event.doseTime;
    final medicine = await _medicineRepository.updateMedicine(
      event.medicine.copyWith(
        rescheduledOn: Map.unmodifiable({
          ...event.medicine.rescheduledOn,
          doseTime: event.minutes,
        }),
      ),
    );
    await RemindersHelper.cancelMedicineReminder(
      event.medicine,
      doseTime: doseTime,
    );
    await RemindersHelper.addMedicineReminder(medicine, doseTime: doseTime);
    emit(
      MedicinePostponed(
        medicine,
        value: duration,
        doseTime: doseTime,
        selectedDay: state.selectedDay,
        tasks: state.tasks,
        medicines: List.unmodifiable([
          for (final item in state.medicines)
            if (item.id == medicine.id) medicine else item,
        ]),
      ),
    );
  }

  Future<void> _onDeleteMedicine(
      DeleteMedicine event, Emitter<RemindersState> emit) async {
    final deleted = await _medicineRepository.removeMedicine(event.medicine);
    if (!deleted) return;
    await RemindersHelper.cancelMedicineReminders(event.medicine);
    emit(
      MedicineDeleted(
        event.medicine,
        selectedDay: state.selectedDay,
        tasks: state.tasks,
        medicines: List.unmodifiable(
          state.medicines.where((item) => item.id != event.medicine.id),
        ),
      ),
    );
  }

  Future<void> _onCancelAllReminders(
      CancelAllReminders event, Emitter<RemindersState> emit) async {
    await RemindersHelper.cancelAll();
  }
}
