// ignore_for_file: invalid_annotation_target
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/address_component.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geometry.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'geocoding_result.freezed.dart';

part 'geocoding_result.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.geocodingResultModel)
class GeocodingResult with _$GeocodingResult {
  factory GeocodingResult({
    @HiveField(0) required List<String> types,
    @HiveField(1)@JsonKey(name: "place_id") required String? placeId,
    @HiveField(2)@JsonKey(name: "formatted_address") @Default(null) String? formattedAddress,
    @HiveField(3)@JsonKey(name: "address_components") @Default([]) List<AddressComponent> addressComponents,
    @HiveField(4)@JsonKey(name: "postcode_localities") @Default([]) List<String> postcodeLocalities,
    @HiveField(5) @Default(null) Geometry? geometry,
    @HiveField(6)@JsonKey(name: "partial_match") @Default(false) bool partialMatch,
  }) = _GeocodingResult;

  factory GeocodingResult.fromJson(Map<String, dynamic> json) => _$GeocodingResultFromJson(json);
}
