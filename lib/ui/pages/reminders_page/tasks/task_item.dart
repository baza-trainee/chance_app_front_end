import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
    this.task, {
    this.onTap,
    super.key,
  });

  final TaskModel task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hasActiveReminder = task.reminderTime?.isAfter(now) ?? false;
    return ListTile(
      onTap: onTap,
      tileColor: primary50,
      horizontalTitleGap: 4,
      leading: Icon(
        task.isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank,
        size: 28,
        color: task.isDone ? darkNeutral400 : primaryText,
      ),
      title: Text(
        task.message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          color: task.isDone ? darkNeutral400 : primaryText,
          decoration:
              task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Text.rich(
        TextSpan(
          text: Jiffy.parseFromDateTime(task.date.toLocal()).Hm,
          children: [
            if (hasActiveReminder)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.alarm,
                    color: task.isDone ? darkNeutral400 : primaryText,
                  ),
                ),
              ),
          ],
        ),
        style: TextStyle(
          fontSize: 16,
          color: task.isDone
              ? darkNeutral400
              : task.date.isBefore(now)
                  ? red900
                  : primaryText,
        ),
      ),
    );
  }
}
