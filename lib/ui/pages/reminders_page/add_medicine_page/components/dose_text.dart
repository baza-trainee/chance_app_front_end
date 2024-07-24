import 'package:chance_app/ux/enum/medicine_type.dart';
import 'package:flutter/widgets.dart';

class DoseText extends Text {
  DoseText({
    required MedicineType? medicineType,
    required int count,
    bool withCounter = false,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    super.key,
  }) : super(
          [
            if (withCounter) count,
            (medicineType ?? MedicineType.other).toDoseString(count),
          ].join(' '),
        );
}
