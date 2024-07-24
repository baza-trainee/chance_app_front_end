import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'invitation_status.g.dart';

@JsonEnum()
@HiveType(typeId: HiveTypeId.invitationStatusId)
enum InvitationStatus {
  @HiveField(0)
  pending,
  @HiveField(1)
  accepted,
  @HiveField(2)
  error,
  @HiveField(3)
  canceled;

  String toLocalizedString() {
    switch (this) {
      case InvitationStatus.pending:
        return AppLocalizations.instance.translate("pending");
      case InvitationStatus.accepted:
        return AppLocalizations.instance.translate("accepted");
      case InvitationStatus.error:
        return AppLocalizations.instance.translate("error");
      case InvitationStatus.canceled:
        return AppLocalizations.instance.translate("canceled");
    }
  }
}
