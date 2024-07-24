import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/reminders_page/components/medicine_header.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:flutter/material.dart';

class MedicineStatusUpdatedDialog extends StatelessWidget {
  const MedicineStatusUpdatedDialog(
    this.medicine, {
    required this.doseTime,
    required this.status,
    this.bottom,
    super.key,
  });

  final MedicineModel medicine;
  final DateTime doseTime;
  final ReminderState status;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        MedicineHeader(
          medicine,
          doseCount: medicine.getDoseCountFor(doseTime),
        ),
        const SizedBox(height: 8),
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
