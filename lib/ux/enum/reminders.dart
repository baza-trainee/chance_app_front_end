import 'package:chance_app/resources/app_icons.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';

enum Reminders {
  tasks,
  medicine;

  String get svgIcon {
    switch (this) {
      case Reminders.tasks:
        return AppIcons.tasksSmall;
      case Reminders.medicine:
        return AppIcons.pillsSmall;
    }
  }

  String toLocalizedString() {
    switch (this) {
      case Reminders.tasks:
        return AppLocalizations.instance.translate("tasks");
      case Reminders.medicine:
        return AppLocalizations.instance.translate("medicine");
    }
  }
}
