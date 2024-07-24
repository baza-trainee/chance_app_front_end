import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/edit_task_schedule_bottom_sheet.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/reschedule_time_picker.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/task_item.dart';
import 'package:chance_app/ux/bloc/reminders_bloc/reminders_bloc.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:collection/collection.dart';
import 'package:cupertino_listview/cupertino_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class TaskList extends StatelessWidget {
  const TaskList(
    this.tasks, {
    required this.dayDate,
    super.key,
  });

  final List<TaskModel> tasks;
  final DateTime dayDate;

  Future<bool> _onDeleteConfirmation(BuildContext context) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
            "${AppLocalizations.instance.translate("areYouSureYouWantToDeleteTheTask")}?"),
        contentTextStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: primaryText,
        ),
        actionsPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.instance.translate("cancel")),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(AppLocalizations.instance.translate("delete")),
          ),
        ],
      ),
    );
    return accepted ?? false;
  }

  Future<void> _onItemPressed(
    BuildContext context, {
    required TaskModel item,
  }) async {
    final result = await showModalBottomSheet<ReminderState>(
      context: context,
      backgroundColor: beige100,
      showDragHandle: true,
      builder: (context) => EditTaskScheduleBottomSheet(item),
    );
    if (result == null || !context.mounted) return;

    switch (result) {
      case ReminderState.deleted:
        final accepted = await _onDeleteConfirmation(context);
        if (accepted && context.mounted) {
          context.read<RemindersBloc>().add(DeleteTask(item));
        }

      case ReminderState.done:
        context.read<RemindersBloc>().add(TaskIsDone(item));

      case ReminderState.missed:
        break;

      case ReminderState.rescheduled:
        final minutes = await showModalBottomSheet<int>(
          context: context,
          backgroundColor: beige100,
          showDragHandle: true,
          builder: (context) => const RescheduleTimePicker(),
        );
        if (minutes == null || !context.mounted) return;
        context
            .read<RemindersBloc>()
            .add(TaskIsPostponed(item, minutes: minutes));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = tasks
        .where((e) => DateUtils.isSameDay(e.date.toLocal(), dayDate))
        .sortedBy((e) => e.date);

    if (items.isEmpty) return _emptyListPlaceholder();

    return CupertinoListView.builder(
      physics: const BouncingScrollPhysics(),
      sectionCount: 1,
      itemInSectionCount: (_) => items.length,
      sectionBuilder: (context, sectionPath, _) {
        return Container(
          color: theme.scaffoldBackgroundColor,
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  DateUtils.isSameDay(dayDate, DateTime.now())
                      ? AppLocalizations.instance.translate("today")
                      : Jiffy.parseFromDateTime(dayDate).MMMMd,
                  style: const TextStyle(fontSize: 28, color: primaryText),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/tasks_for_today");
                },
                child: Text(
                  AppLocalizations.instance.translate("allTasks"),
                  style: const TextStyle(
                    fontSize: 16,
                    color: primary700,
                    decorationColor: primary700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      childBuilder: (context, indexPath) {
        final task = items[indexPath.child];
        return TaskItem(
          task,
          onTap: () => _onItemPressed(context, item: task),
        );
      },
    );
  }

  Widget _emptyListPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        AppLocalizations.instance.translate("addTask"),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
