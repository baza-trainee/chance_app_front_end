import 'package:chance_app/ui/components/separated_list.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ReminderActions extends StatelessWidget {
  const ReminderActions({
    required this.onMissedPressed,
    required this.onDonePressed,
    required this.onReschedulePressed,
    this.missedText,
    this.doneText,
    this.rescheduleText,
    super.key,
  });

  final VoidCallback? onMissedPressed;
  final VoidCallback? onDonePressed;
  final VoidCallback? onReschedulePressed;
  final String? missedText;
  final String? doneText;
  final String? rescheduleText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkNeutral800,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SeparatedList(
          axis: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          separator: const SizedBox(width: 4),
          children: [
            _labeledIconButton(
              onPressed: onMissedPressed,
              label: missedText ?? AppLocalizations.instance.translate("miss"),
              icon: Icons.close,
            ),
            _labeledIconButton(
              onPressed: onDonePressed,
              style: IconButton.styleFrom(
                backgroundColor: primary300,
                foregroundColor: primaryText,
              ),
              label: doneText ?? AppLocalizations.instance.translate("done"),
              icon: Icons.check,
            ),
            _labeledIconButton(
              onPressed: onReschedulePressed,
              label: rescheduleText ?? AppLocalizations.instance.translate("postpone"),
              icon: Icons.alarm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _labeledIconButton({
    required String label,
    required IconData icon,
    ButtonStyle? style,
    VoidCallback? onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.outlined(
          onPressed: onPressed,
          style: IconButton.styleFrom(
            fixedSize: const Size.square(56),
            foregroundColor: primary50,
            side: BorderSide(
              color: (onPressed == null) ? darkNeutral600 : primary300,
            ),
          ).merge(style),
          iconSize: 24,
          icon: Icon(icon),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: primary50,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
