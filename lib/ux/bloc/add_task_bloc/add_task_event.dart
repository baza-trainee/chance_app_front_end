part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskEvent {}


class SaveTaskName extends AddTaskEvent {
  final String name;

  SaveTaskName({required this.name});
}

class ChangeMonthForTasks extends AddTaskEvent {
  final SideSwipe sideSwipe;

  ChangeMonthForTasks({required this.sideSwipe});
}

class SelectedDateForTasks extends AddTaskEvent {
  final Map<String, dynamic> selectedDate;

  SelectedDateForTasks({required this.selectedDate});
}

class SaveDeadlineForTask extends AddTaskEvent {
  final DateTime dateTime;

  SaveDeadlineForTask({required this.dateTime});
}

class SelectNotificationBefore extends AddTaskEvent {
  final NotificationsBefore notificationsBefore;
  final int session;

  SelectNotificationBefore(
      {required this.notificationsBefore, required this.session});
}

class CancelNotificationBefore extends AddTaskEvent {
  final int session;

  CancelNotificationBefore({required this.session});
}

class CancelAllDataNotificationBefore extends AddTaskEvent {
  final int session;
  CancelAllDataNotificationBefore(this.session);
}

class LoadDataForSelectDateForTasks extends AddTaskEvent {
  LoadDataForSelectDateForTasks();
}
class ClearState extends AddTaskEvent {
  ClearState();
}