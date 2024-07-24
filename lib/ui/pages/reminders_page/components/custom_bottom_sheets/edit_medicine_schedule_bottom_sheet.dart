import 'package:chance_app/resources/app_icons.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/components/medicine_header.dart';
import 'package:chance_app/ui/pages/reminders_page/components/reminder_actions.dart';
import 'package:chance_app/ux/enum/instruction.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

class EditMedicineScheduleBottomSheet extends StatelessWidget {
  /// Returns [ReminderActionResult] value.
  const EditMedicineScheduleBottomSheet(
    this.medicine, {
    required this.doseTime,
    super.key,
  });

  final MedicineModel medicine;
  final DateTime doseTime;

  @override
  Widget build(BuildContext context) {
    final count = medicine.getDoseCountFor(doseTime) ?? 0;
    final actualDoseTime = medicine.getActualDoseTime(doseTime);
    final parsedDate = Jiffy.parseFromDateTime(actualDoseTime);
    return SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MedicineHeader(medicine),
                const SizedBox(height: 8),
                Text(
                  [
                    count,
                    medicine.type.toDoseString(count).toLowerCase(),
                    DateUtils.isSameDay(doseTime.toLocal(), DateTime.now())
                        ? AppLocalizations.instance.translate("today").toLowerCase()
                        : parsedDate.MMMMd,
                    AppLocalizations.instance.translate("on").toLowerCase(),
                    parsedDate.Hm,
                  ].join(" "),
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                if (medicine.instruction != Instruction.noMatter) ...[
                  const SizedBox(height: 6),
                  Text(
                    [
                      medicine.instruction.toLocalizedString().toLowerCase(),
                    ].join(" "),
                    style: const TextStyle(fontSize: 16, letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 24),
                ReminderActions(
                  doneText: AppLocalizations.instance.translate("accept"),
                  onMissedPressed: Navigator.of(context).pop,
                  onDonePressed: () =>
                      Navigator.of(context).pop(ReminderState.done),
                  onReschedulePressed: () =>
                      Navigator.of(context).pop(ReminderState.rescheduled),
                ),
              ],
            ),
          ),
          Positioned(
            top: -12,
            right: 12,
            child: _deleteButton(context),
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(ReminderState.deleted),
      tooltip: AppLocalizations.instance.translate("delete"),
      icon: SvgPicture.asset(
        AppIcons.trash,
        color: Colors.black,
        height: 24,
      ),
    );
  }
}
