import 'package:chance_app/resources/app_icons.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskHeader extends StatelessWidget {
  const TaskHeader(
    this.task, {
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppIcons.tasksBig,
          color: beige500,
          height: 33,
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalizations.instance.translate("tasks"),
          style: const TextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
            color: primaryText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          task.message,
          style: const TextStyle(fontSize: 24, color: primaryText),
        ),
      ],
    );
  }
}
