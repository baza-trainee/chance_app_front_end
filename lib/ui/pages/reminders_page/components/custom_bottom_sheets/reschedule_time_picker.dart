import 'dart:math' show pow;

import 'package:chance_app/ui/components/separated_list.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RescheduleTimePicker extends StatefulWidget {
  /// Returns [int] which is equal to selected value.
  const RescheduleTimePicker({super.key});

  @override
  State<RescheduleTimePicker> createState() => _RescheduleTimePickerState();
}

class _RescheduleTimePickerState extends State<RescheduleTimePicker> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final actionButtonStyle = TextButton.styleFrom(
      foregroundColor: primary700,
      textStyle: const TextStyle(fontSize: 22),
    );
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.instance.translate("postponeOn"),
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SeparatedList(
              axis: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              separator: const SizedBox(width: 12),
              children: List.generate(
                3,
                (i) => _tile(value: (i + 1) * 5),
              ),
            ),
            const SizedBox(height: 12),
            SeparatedList(
              axis: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              separator: const SizedBox(width: 12),
              children: List.generate(
                3,
                (i) => _tile(value: pow(2, i).toInt() * 30),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  style: actionButtonStyle,
                  child: Text(AppLocalizations.instance.translate("cancel")),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_selectedValue),
                  style: actionButtonStyle,
                  child: const Text("Oк"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile({required int value}) {
    final isSelected = value == _selectedValue;
    return SizedBox.square(
      dimension: 80,
      child: Material(
        color: isSelected ? darkNeutral800 : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isSelected ? Colors.transparent : darkNeutral400,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => setState(() => _selectedValue = value),
          child: Center(
            child: Text(
              "$value${AppLocalizations.instance.translate("min")}",
              style: TextStyle(
                fontSize: 24,
                color: isSelected ? primary50 : primaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
