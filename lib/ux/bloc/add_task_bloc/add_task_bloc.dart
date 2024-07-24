import 'dart:async';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/custom_bottom_sheet_notification_picker.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

enum SideSwipe {
  left,
  right,
}

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState()) {
    on<SaveTaskName>(_onSaveTaskName);
    on<ChangeMonthForTasks>(_onChangeMonthForTasks);
    on<SelectedDateForTasks>(_onSelectedDateForTasks);
    on<SaveDeadlineForTask>(_onSaveDeadlineForTask);
    on<SelectNotificationBefore>(_onSelectNotificationBefore);
    on<CancelNotificationBefore>(_onCancelNotificationBefore);
    on<CancelAllDataNotificationBefore>(_onCancelAllDataNotificationBefore);
    on<LoadDataForSelectDateForTasks>(_onLoadDataForSelectDateForTasks);
    on<ClearState>(_onClearState);
  }
  bool checkIfDayHasTask(
      List<TaskModel> myTasks, int day, int month, int year) {
    for (int i = 0; i < myTasks.length; i++) {
      DateTime taskDate = myTasks[i].date;
      if (DateUtils.isSameDay(taskDate, DateTime(year, month, day))) {
        return true;
      }
    }
    return false;
  }

  FutureOr<void> _onSaveTaskName(
      SaveTaskName event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(taskTitle: event.name));
  }

  FutureOr<void> _onChangeMonthForTasks(
      ChangeMonthForTasks event, Emitter<AddTaskState> emit) {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      List<Map<String, dynamic>> dates = [];
      DateTime now = state.dateForSwipingForTasks ?? DateTime.now();
      int plusOrMinus = event.sideSwipe == SideSwipe.left ? -1 : 1;
      int year = now.year;
      int month = now.month;
      if (month + plusOrMinus <= 12 && month + plusOrMinus >= 0) {
        month = now.month + plusOrMinus;
      } else {
        if (event.sideSwipe == SideSwipe.left) {
          year = now.year - 1;
          month = 12;
        } else {
          year = now.year + 1;
          month = 1;
        }
      }

      int daysInMonth = DateTime(year, month + 1, 0).day;
      DateTime? selectedDate = state.selectedDate;
      List<TaskModel> myTasks = List.from(
          HiveCRUD().myTasks.where((element) => element.isRemoved == false));

      for (int i = 1; i <= daysInMonth; i++) {
        DateTime date = DateTime(year, month, i);
        String weekDay = getWeekdayName(date.weekday);
        dates.add({
          "weekDay": weekDay,
          "number": (i.toString()).padLeft(2, "0"),
          "month": month,
          "year": year,
          "isSelected": (state.selectedDate != null &&
              DateUtils.isSameDay(date, selectedDate)),
          "hasTasks": checkIfDayHasTask(myTasks, i, month, year)
        });
      }
      emit(state.copyWith(
          daysForTasks: dates,
          dateForSwipingForTasks: DateTime(year, month),
          isLoading: false));
    }
  }

  FutureOr<void> _onSelectedDateForTasks(
      SelectedDateForTasks event, Emitter<AddTaskState> emit) {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      List<Map<String, dynamic>> dates = state.daysForTasks;
      Map<String, dynamic> date = event.selectedDate;
      int index = dates.indexWhere((e) => e["number"] == date["number"]);
      for (int i = 0; i < dates.length; i++) {
        dates[i]["isSelected"] = false;
      }
      dates[index]["isSelected"] = true;
      emit(state.copyWith(
        daysForTasks: dates,
        oldSelectedDateForTasks: state.newSelectedDateForTasks,
        newSelectedDateForTasks: DateTime(dates[index]["year"],
            dates[index]["month"], int.parse(dates[index]["number"])),
        isLoading: false,
      ));
    }
  }

  FutureOr<void> _onSaveDeadlineForTask(
      SaveDeadlineForTask event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(
        oldDeadlineForTask: state.newDeadlineForTask,
        newDeadlineForTask: event.dateTime));
  }

  FutureOr<void> _onSelectNotificationBefore(
      SelectNotificationBefore event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(
        notificationsBefore: event.notificationsBefore,
        sessionForNotification: event.session));
  }

  FutureOr<void> _onCancelNotificationBefore(
      CancelNotificationBefore event, Emitter<AddTaskState> emit) {
    if (event.session == state.sessionForNotification) {
      emit(state.copyWith(notificationsBefore: null));
    }
  }

  FutureOr<void> _onCancelAllDataNotificationBefore(
      CancelAllDataNotificationBefore event, Emitter<AddTaskState> emit) {
    if (event.session == state.sessionForSelectingDateForTask) {
      emit(state.copyWith(
          notificationsBefore: state.notificationsBefore,
          newDeadlineForTask: state.oldDeadlineForTask,
          newSelectedDateForTasks: state.oldSelectedDateForTasks));
    }
  }

  FutureOr<void> _onLoadDataForSelectDateForTasks(
      LoadDataForSelectDateForTasks event, Emitter<AddTaskState> emit) {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      List<Map<String, dynamic>> dates = [];
      DateTime now = DateTime.now();
      int year = now.year;
      int month = now.month;
      int day = now.day;
      int daysInMonth = DateTime(year, month + 1, 0).day;
      List<TaskModel> myTasks = List.from(
          HiveCRUD().myTasks.where((element) => element.isRemoved == false));

      for (int i = 1; i <= daysInMonth; i++) {
        DateTime date = DateTime(year, month, i);
        String weekDay = getWeekdayName(date.weekday);
        dates.add({
          "weekDay": weekDay,
          "number": (i.toString()).padLeft(2, "0"),
          "month": month,
          "year": year,
          "isSelected": day == i ||
              (state.selectedDate != null &&
                  DateUtils.isSameDay(date, state.selectedDate)),
          "hasTasks": checkIfDayHasTask(myTasks, i, month, year)
        });
      }
      myTasks = myTasks
          .where((element) =>
              DateUtils.isSameDay(element.date, now) &&
              element.isRemoved == false)
          .toList();
      myTasks.sort((a, b) => a.date.compareTo(b.date));
      emit(state.copyWith(
        daysForTasks: dates,
        oldSelectedDateForTasks: DateTime.now(),
        newSelectedDateForTasks: DateTime.now(),
        dateForSwipingForTasks: DateTime.now(),
        isLoading: false,
      ));
    }
  }

  FutureOr<void> _onClearState(ClearState event, Emitter<AddTaskState> emit) {
    emit(state.clear());
  }
}
