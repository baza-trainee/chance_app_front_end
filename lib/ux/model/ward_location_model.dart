import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ward_location_model.freezed.dart';

part 'ward_location_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.wardLocationModel)
class WardLocationModel with _$WardLocationModel {
  const factory WardLocationModel({
    @HiveField(0) required String id,
    @HiveField(1) required String myEmail,
    @HiveField(2) required String myName,
    @HiveField(3) required double latitude,
    @HiveField(4) required double longitude,
    @HiveField(5) required String toUserEmail,
    @HiveField(6) required DateTime when,
  }) = _WardLocationModel;

  factory WardLocationModel.fromJson(Map<String, dynamic> json) =>
      _$WardLocationModelFromJson(json);
}
