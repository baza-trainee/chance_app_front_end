import 'package:chance_app/ui/pages/navigation/place_picker/src/models/location.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'bounds.freezed.dart';
part 'bounds.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.boundsModel)
class Bounds with _$Bounds {
  factory Bounds({
    @HiveField(0) required Location northeast,
    @HiveField(1) required Location southwest,
  }) = _Bounds;

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}
