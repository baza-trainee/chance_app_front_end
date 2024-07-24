import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'instruction.g.dart';

@JsonEnum()
@HiveType(typeId: HiveTypeId.instruction)
enum Instruction {
  @HiveField(0)
  beforeEating,
  @HiveField(1)
  whileEating,
  @HiveField(2)
  afterEating,
  @HiveField(3)
  noMatter;

  String toLocalizedString() {
    switch (this) {
      case Instruction.beforeEating:
        return AppLocalizations.instance.translate("beforeEating");
      case Instruction.whileEating:
        return AppLocalizations.instance.translate("whileEating");
      case Instruction.afterEating:
        return AppLocalizations.instance.translate("afterMeals");
      case Instruction.noMatter:
        return AppLocalizations.instance.translate("doesNotMatter");
    }
  }
}
