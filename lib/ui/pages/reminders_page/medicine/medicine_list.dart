import 'dart:collection';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/edit_medicine_schedule_bottom_sheet.dart';
import 'package:chance_app/ui/pages/reminders_page/components/custom_bottom_sheets/reschedule_time_picker.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/reminders_page/medicine/medicine_item.dart';
import 'package:chance_app/ux/bloc/reminders_bloc/reminders_bloc.dart';
import 'package:chance_app/ux/enum/reminder_action_result.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:cupertino_listview/cupertino_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineList extends StatelessWidget {
  const MedicineList(this.medicines, {
    required this.dayDate,
    super.key,
  });

  final List<MedicineModel> medicines;
  final DateTime dayDate;

  Future<bool> _onDeleteConfirmation(BuildContext context) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) =>
          AlertDialog(
            content: Text(AppLocalizations.instance.translate("areYouSureYouWantToRemoveTheMedication")),
            contentTextStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              color: primaryText,
            ),
            actionsPadding: const EdgeInsets.symmetric(
                vertical: 4, horizontal: 12),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                    AppLocalizations.instance.translate("cancel")),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                    AppLocalizations.instance.translate("delete")),
              ),
            ],
          ),
    );
    return accepted ?? false;
  }

  Future<void> _onItemPressed(BuildContext context, {
    required MedicineModel item,
    required DateTime doseTime,
  }) async {
    final result = await showModalBottomSheet<ReminderState>(
      context: context,
      backgroundColor: beige100,
      showDragHandle: true,
      builder: (context) =>
          EditMedicineScheduleBottomSheet(
            item,
            doseTime: doseTime,
          ),
    );
    if (result == null || !context.mounted) return;

    switch (result) {
      case ReminderState.deleted:
        final accepted = await _onDeleteConfirmation(context);
        if (accepted && context.mounted) {
          context.read<RemindersBloc>().add(DeleteMedicine(item));
        }

      case ReminderState.done:
        context.read<RemindersBloc>().add(MedicineIsDone(item, at: doseTime));

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
        context.read<RemindersBloc>().add(
          MedicineIsPostponed(
            item,
            doseTime: doseTime,
            minutes: minutes,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = medicines.where((e) => e.shouldBeTakenAt(dayDate));
    final groupedItems = SplayTreeMap<DateTime, List<MedicineModel>>();

    for (final medicine in items) {
      for (final timeOffset in medicine.doses.keys) {
        final doseTime = DateTime(
          dayDate.year,
          dayDate.month,
          dayDate.day,
          0,
          timeOffset,
        );
        if (!groupedItems.containsKey(doseTime)) groupedItems[doseTime] = [];
        groupedItems[doseTime]!.add(medicine);
      }
    }

    if (groupedItems.isEmpty) return _emptyListPlaceholder();

    return CupertinoListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sectionCount: groupedItems.length,
      itemInSectionCount: (i) =>
      groupedItems.values
          .elementAt(i)
          .length,
      sectionBuilder: (context, sectionPath, _) {
        final doseTime = groupedItems.keys.elementAt(sectionPath.section);
        return Container(
          color: theme.scaffoldBackgroundColor,
          width: double.infinity,
          child: Text(
            TimeOfDay.fromDateTime(doseTime).format(context),
            style: const TextStyle(fontSize: 32, color: primaryText),
          ),
        );
      },
      childBuilder: (context, indexPath) {
        final doseTime = groupedItems.keys.elementAt(indexPath.section);
        final group = groupedItems.values.elementAt(indexPath.section);
        final medicine = group[indexPath.child];
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: MedicineItem(
            medicine,
            doseTime: doseTime,
            onTap: () =>
                _onItemPressed(
                  context,
                  item: medicine,
                  doseTime: doseTime,
                ),
          ),
        );
      },
    );
  }

  Widget _emptyListPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        AppLocalizations.instance.translate("addMedicationReminders"),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
