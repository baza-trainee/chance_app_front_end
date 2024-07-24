import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'location.freezed.dart';

part 'location.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.locationModel)
class Location with _$Location {
  factory Location({
    @HiveField(0) required double lat,
    @HiveField(1) required double lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
