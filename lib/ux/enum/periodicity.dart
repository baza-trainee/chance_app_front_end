import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'periodicity.g.dart';

@JsonEnum()
@HiveType(typeId: HiveTypeId.periodicity)
enum Periodicity {
  @HiveField(0)
  everyDay,
  @HiveField(1)
  inADay,
  @HiveField(2)
  certainDays;

  String toLocalizedString() {
    switch (this) {
      case Periodicity.everyDay:
        return AppLocalizations.instance.translate("daily");
      case Periodicity.inADay:
        return AppLocalizations.instance.translate("every2Days");
      case Periodicity.certainDays:
        return AppLocalizations.instance.translate("certainDaysOfTheWeek");
    }
  }
}
