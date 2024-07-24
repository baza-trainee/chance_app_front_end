part of 'add_task_bloc.dart';

@immutable
class AddTaskState {
  final String taskTitle;
  final List<String> notifications = [
    AppLocalizations.instance.translate("noDueDate"),
    AppLocalizations.instance.translate("inTime"),
    AppLocalizations.instance.translate("in5Minutes"),
    AppLocalizations.instance.translate("in30Minutes"),
    AppLocalizations.instance.translate("in60Minutes"),
    AppLocalizations.instance.translate("inOneDay"),
  ];
  final NotificationsBefore notificationsBefore;
  final TaskModel? taskModel;
  final List<Map<String, dynamic>> daysForTasks;
  final DateTime? selectedDate,
      oldSelectedDateForTasks,
      newSelectedDateForTasks,
      dateForSwipingForTasks,
      oldDeadlineForTask,
      newDeadlineForTask;
  final int sessionForNotification, sessionForSelectingDateForTask;
  final bool isLoading;

  AddTaskState({
    this.taskTitle = "",
    this.notificationsBefore = NotificationsBefore.no,
    this.taskModel,
    this.daysForTasks = const [],
    this.selectedDate,
    this.oldSelectedDateForTasks,
    this.newSelectedDateForTasks,
    this.dateForSwipingForTasks,
    this.oldDeadlineForTask,
    this.sessionForNotification = 0,
    this.sessionForSelectingDateForTask = 0,
    this.newDeadlineForTask,
    this.isLoading = false,
  });

  AddTaskState copyWith({
    String? taskTitle,
    DateTime? selectedDate,
    DateTime? dateForSwiping,
    DateTime? oldSelectedDateForTasks,
    DateTime? newSelectedDateForTasks,
    DateTime? dateForSwipingForTasks,
    DateTime? oldDeadlineForTask,
    DateTime? newDeadlineForTask,
    List<Map<String, dynamic>>? daysForTasks,
    bool? isCalendarOpened,
    int? pageForPills,
    int? pageForTasks,
    int? sessionForNotification,
    int? sessionForSelectingDateForTask,
    NotificationsBefore? notificationsBefore,
    TaskModel? taskModel,
    bool? isLoading,
  }) {
    return AddTaskState(
      taskTitle: taskTitle ?? this.taskTitle,
      selectedDate: selectedDate ?? this.selectedDate,
      oldSelectedDateForTasks:
          oldSelectedDateForTasks ?? this.oldSelectedDateForTasks,
      newSelectedDateForTasks:
          newSelectedDateForTasks ?? this.newSelectedDateForTasks,
      dateForSwipingForTasks:
          dateForSwipingForTasks ?? this.dateForSwipingForTasks,
      daysForTasks: daysForTasks ?? this.daysForTasks,
      newDeadlineForTask: newDeadlineForTask ?? this.newDeadlineForTask,
      oldDeadlineForTask: oldDeadlineForTask ?? this.oldDeadlineForTask,
      notificationsBefore: notificationsBefore ?? this.notificationsBefore,
      sessionForNotification:
          sessionForNotification ?? this.sessionForNotification,
      taskModel: taskModel ?? this.taskModel,
      sessionForSelectingDateForTask:
          sessionForSelectingDateForTask ?? this.sessionForSelectingDateForTask,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  AddTaskState clear() {
    return AddTaskState(
      selectedDate: DateTime.now(),
      oldSelectedDateForTasks: DateTime.now(),
      newSelectedDateForTasks: DateTime.now(),
      dateForSwipingForTasks: DateTime.now(),
      daysForTasks: const [],
      newDeadlineForTask: DateTime.now(),
      oldDeadlineForTask: DateTime.now(),
      notificationsBefore: NotificationsBefore.no,
      sessionForNotification: 0,
      taskModel: null,
      sessionForSelectingDateForTask: 0,
      taskTitle: "",
      isLoading: false,
    );
  }
}
