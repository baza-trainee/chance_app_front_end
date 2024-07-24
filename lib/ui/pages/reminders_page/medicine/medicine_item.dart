import 'package:chance_app/ui/components/separated_list.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem(
    this.medicine, {
    required this.doseTime,
    this.onTap,
    super.key,
  });

  final MedicineModel medicine;
  final DateTime doseTime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final doseCount = medicine.getDoseCountFor(doseTime);
    final status = medicine.getStatus(doseTime);
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: primary100,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 42,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          medicine.type.svgIcon,
                          color: beige500,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: _statusIcon(status),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                const SizedBox(width: 8),
                Expanded(
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 16, color: primaryText),
                    child: SeparatedList(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separator: const SizedBox(height: 4),
                      children: [
                        Text(
                          medicine.name,
                          style: const TextStyle(fontSize: 22),
                        ),
                        if (doseCount != null) _doseCountText(doseCount),
                        _statusText(status),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _doseCountText(int doseCount) {
    return Text(
      [
        doseCount,
        medicine.type.toDoseString(doseCount).toLowerCase(),
      ].join(" "),
    );
  }

  Widget _statusIcon(MedicineStatus status) {
    return IconTheme(
      data: const IconThemeData(size: 21),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (status == MedicineStatus.taken)
            const Icon(Icons.check_circle, color: green)
          else if (status == MedicineStatus.missed)
            const Icon(Icons.error, color: red900)
          else if (status == MedicineStatus.postponed) ...[
            const Icon(Icons.circle, color: primary400),
            Transform.scale(
              scale: 0.75,
              child: const Icon(
                Icons.alarm,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _statusText(MedicineStatus status) {
    final actualDoseTime = medicine.getActualDoseTime(doseTime);
    final timeText = Jiffy.parseFromDateTime(actualDoseTime).Hm;
    switch (status) {
      case MedicineStatus.pending:
        return Text(AppLocalizations.instance.translate("necessaryToAccept"));
      case MedicineStatus.taken:
        return Text(
          "${AppLocalizations.instance.translate("acceptedBy")} $timeText",
          style: const TextStyle(color: green),
        );
      case MedicineStatus.postponed:
        return Text(
          "${AppLocalizations.instance.translate("postponeTo")} $timeText",
          style: const TextStyle(color: primary700),
        );
      case MedicineStatus.missed:
        return Text(
          (actualDoseTime != doseTime)
              ? "${AppLocalizations.instance.translate("postponeTo")} $timeText"
              : AppLocalizations.instance.translate("skipped"),
          style: const TextStyle(color: red900),
        );
    }
  }
}
