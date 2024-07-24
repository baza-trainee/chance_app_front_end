import 'package:chance_app/resources/medicine_icons.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'medicine_type.g.dart';

@JsonEnum()
@HiveType(typeId: HiveTypeId.medicineType)
enum MedicineType {
  @HiveField(0)
  pill,
  @HiveField(1)
  injection,
  @HiveField(2)
  solution,
  @HiveField(3)
  drops,
  @HiveField(4)
  powder,
  @HiveField(5)
  other;

  String get svgIcon {
    switch (this) {
      case MedicineType.pill:
        return MedicineIcons.pill;
      case MedicineType.injection:
        return MedicineIcons.injection;
      case MedicineType.solution:
        return MedicineIcons.solution;
      case MedicineType.drops:
        return MedicineIcons.drops;
      case MedicineType.powder:
        return MedicineIcons.powder;
      case MedicineType.other:
        return MedicineIcons.other;
    }
  }

  String get androidIconAsset {
    switch (this) {
      case MedicineType.pill:
        return "@mipmap/pill";
      case MedicineType.injection:
        return "@mipmap/injection";
      case MedicineType.solution:
        return "@mipmap/solution";
      case MedicineType.drops:
        return "@mipmap/drops";
      case MedicineType.powder:
        return "@mipmap/powder";
      case MedicineType.other:
        return "@mipmap/other";
    }
  }

  String toLocalizedString() {
    switch (this) {
      case MedicineType.pill:
        return AppLocalizations.instance.translate("tablet");
      case MedicineType.injection:
        return AppLocalizations.instance.translate("injection");
      case MedicineType.solution:
        return AppLocalizations.instance.translate("rozchin");
      case MedicineType.drops:
        return AppLocalizations.instance.translate("kraplі");
      case MedicineType.powder:
        return AppLocalizations.instance.translate("powder");
      case MedicineType.other:
        return AppLocalizations.instance.translate("other");
    }
  }

  String toDoseString(int count) {
    switch (this) {
      case MedicineType.pill:
        return (count == 1)
            ? AppLocalizations.instance.translate("tablet")
            : (count > 0 && count < 5)
                ? AppLocalizations.instance.translate("tablet1")
                : AppLocalizations.instance.translate("tablet2");

      case MedicineType.injection:
        return (count == 1)
            ? AppLocalizations.instance.translate("injection")
            : (count > 0 && count < 5)
                ? AppLocalizations.instance.translate("injection1")
                : AppLocalizations.instance.translate("injection2");

      case MedicineType.powder:
        return AppLocalizations.instance.translate("powder");

      case MedicineType.solution:
      case MedicineType.drops:
      case MedicineType.other:
        return (count == 1)
            ? AppLocalizations.instance.translate("dose")
            : (count > 0 && count < 5)
                ? AppLocalizations.instance.translate("dose1")
                : AppLocalizations.instance.translate("dose2");
    }
  }
}
