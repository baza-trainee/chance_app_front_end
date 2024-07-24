import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/reminders_page/components/task_header.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskStatusUpdatedDialog extends StatelessWidget {
  const TaskStatusUpdatedDialog(
    this.task, {
    required this.status,
    this.bottom,
    super.key,
  });

  final TaskModel task;
  final ReminderState status;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        TaskHeader(task),
        Icon(status.icon, size: 24, color: primary1000),
        if (bottom != null)
          DefaultTextStyle(
            style: const TextStyle(fontSize: 28, color: primaryText),
            textAlign: TextAlign.center,
            child: bottom!,
          ),
      ],
    );
  }
}
