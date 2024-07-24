import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'sos_contact_model.freezed.dart';
part 'sos_contact_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.sosContactModel)
class SosContactModel with _$SosContactModel {
  @HiveField(0)
  const factory SosContactModel({
    @HiveField(1) required String name,
    @HiveField(2) required String phone,
    @HiveField(3) @Default("") String groupName,
    @HiveField(4) @Default("") String id,
    @HiveField(5) @Default("") String contactsId,
  }) = _ContactModel;

  factory SosContactModel.fromJson(Map<String, dynamic> json) =>
      _$SosContactModelFromJson(json);
}

@freezed
@HiveType(typeId: HiveTypeId.sosGroupModel)
class SosGroupModel with _$SosGroupModel {
  @HiveField(0)
  const factory SosGroupModel({
    @HiveField(1) @Default("") String id,
    @HiveField(2) required String name,
    @HiveField(3) required List<SosContactModel> contacts,
  }) = _GroupModel;

  factory SosGroupModel.fromJson(Map<String, dynamic> json) =>
      _$SosGroupModelFromJson(json);
}
