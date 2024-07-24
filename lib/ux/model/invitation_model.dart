import 'package:chance_app/ux/enum/invitation_status.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'invitation_model.freezed.dart';

part 'invitation_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.invitationModel)
class InvitationModel with _$InvitationModel {
  const factory InvitationModel({
    @HiveField(0) required String id,
    @HiveField(1) required String toUserEmail,
    @HiveField(2) required String toUserName,
    @HiveField(3) required DateTime? sentDate,
    @HiveField(4) required String fromUserEmail,
    @HiveField(5) required String fromUserName,
    @HiveField(6) @Default(InvitationStatus.pending) InvitationStatus invitationStatus,
  }) = _InvitationModel;

  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationModelFromJson(json);
}
