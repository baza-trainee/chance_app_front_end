// ignore_for_file: invalid_annotation_target
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/address_component.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geocoding_result.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geometry.dart';
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pick_result.freezed.dart';
part 'pick_result.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.pickResultModel)
class PickResult with _$PickResult {
  factory PickResult({
    @HiveField(0)@JsonKey(name: "place_id")  @Default(null) String? placeId,
    @HiveField(1) @Default(null) Geometry? geometry,
    @HiveField(2)@JsonKey(name: "formatted_address")  @Default(null) String? formattedAddress,
    @HiveField(3)  @Default(null) List<String>? types,
    @HiveField(4)@JsonKey(name: "address_components")  @Default(null) List<AddressComponent>? addressComponents,
    @HiveField(5)@JsonKey(name: "adr_address")  @Default(null) String? adrAddress,
    @HiveField(6)@JsonKey(name: "formatted_phone_number")  @Default(null) String? formattedPhoneNumber,
    @HiveField(7)  required String id,
    @HiveField(8)  @Default(null) String? reference,
    @HiveField(9)  @Default(null) String? icon,
    @HiveField(10)  @Default(null) String? name,
    @HiveField(13)@JsonKey(name: "international_phone_number")  @Default(null) String? internationalPhoneNumber,
    @HiveField(15)  @Default(null) num? rating,
    @HiveField(16)  @Default(null) String? scope,
    @HiveField(17)  @Default(null) String? url,
    @HiveField(18)  @Default(null) String? vicinity,
    @HiveField(19)@JsonKey(name: "utc_offset")  @Default(null) num? utcOffset,
    @HiveField(20)  @Default(null) String? website,
    @HiveField(22)  @Default(false) bool star,
    @HiveField(23)@JsonKey(name: "is_recently_searched")  @Default(true) bool isRecentlySearched,
  }) = _PickResult;

  factory PickResult.fromJson(Map<String, dynamic> json) => _$PickResultFromJson(json);

  factory PickResult.fromGeocodingResult(GeocodingResult result) {
    return PickResult(
      placeId: result.placeId,
      geometry: result.geometry,
      formattedAddress: result.formattedAddress,
      types: result.types,
      addressComponents: result.addressComponents, id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }
}
