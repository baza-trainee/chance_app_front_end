// ignore_for_file: invalid_annotation_target
import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'address_component.freezed.dart';
part 'address_component.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.addressComponentModel)
class AddressComponent with _$AddressComponent {
  const factory AddressComponent({
    @HiveField(0) required List<String> types,
    @HiveField(1) @JsonKey(name: "long_name") required String longName,
    @HiveField(2) @JsonKey(name: "short_name") required String shortName,
  }) = _AddressComponent;

  factory AddressComponent.fromJson(Map<String, dynamic> json) => _$AddressComponentFromJson(json);
}
