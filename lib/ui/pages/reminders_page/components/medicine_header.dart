import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicineHeader extends StatelessWidget {
  const MedicineHeader(
    this.medicine, {
    this.doseCount,
    super.key,
  });

  final MedicineModel medicine;
  final int? doseCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          medicine.type.svgIcon,
          color: beige500,
          height: 33,
        ),
        const SizedBox(height: 8),
        Text(
          medicine.name,
          style: const TextStyle(fontSize: 22, color: primaryText),
        ),
        if (doseCount != null)
          Text(
            [
              doseCount,
              medicine.type.toDoseString(doseCount!).toLowerCase(),
            ].join(" "),
            style: const TextStyle(fontSize: 16, color: primaryText),
          ),
      ],
    );
  }
}
