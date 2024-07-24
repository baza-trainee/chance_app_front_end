// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeocodingResult _$GeocodingResultFromJson(Map<String, dynamic> json) {
  return _GeocodingResult.fromJson(json);
}

/// @nodoc
mixin _$GeocodingResult {
  @HiveField(0)
  List<String> get types => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "place_id")
  String? get placeId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  String? get formattedAddress => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "address_components")
  List<AddressComponent> get addressComponents =>
      throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "postcode_localities")
  List<String> get postcodeLocalities => throw _privateConstructorUsedError;
  @HiveField(5)
  Geometry? get geometry => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "partial_match")
  bool get partialMatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodingResultCopyWith<GeocodingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodingResultCopyWith<$Res> {
  factory $GeocodingResultCopyWith(
          GeocodingResult value, $Res Function(GeocodingResult) then) =
      _$GeocodingResultCopyWithImpl<$Res, GeocodingResult>;
  @useResult
  $Res call(
      {@HiveField(0) List<String> types,
      @HiveField(1) @JsonKey(name: "place_id") String? placeId,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      String? formattedAddress,
      @HiveField(3)
      @JsonKey(name: "address_components")
      List<AddressComponent> addressComponents,
      @HiveField(4)
      @JsonKey(name: "postcode_localities")
      List<String> postcodeLocalities,
      @HiveField(5) Geometry? geometry,
      @HiveField(6) @JsonKey(name: "partial_match") bool partialMatch});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$GeocodingResultCopyWithImpl<$Res, $Val extends GeocodingResult>
    implements $GeocodingResultCopyWith<$Res> {
  _$GeocodingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
    Object? placeId = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? postcodeLocalities = null,
    Object? geometry = freezed,
    Object? partialMatch = null,
  }) {
    return _then(_value.copyWith(
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>,
      postcodeLocalities: null == postcodeLocalities
          ? _value.postcodeLocalities
          : postcodeLocalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      partialMatch: null == partialMatch
          ? _value.partialMatch
          : partialMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeocodingResultImplCopyWith<$Res>
    implements $GeocodingResultCopyWith<$Res> {
  factory _$$GeocodingResultImplCopyWith(_$GeocodingResultImpl value,
          $Res Function(_$GeocodingResultImpl) then) =
      __$$GeocodingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String> types,
      @HiveField(1) @JsonKey(name: "place_id") String? placeId,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      String? formattedAddress,
      @HiveField(3)
      @JsonKey(name: "address_components")
      List<AddressComponent> addressComponents,
      @HiveField(4)
      @JsonKey(name: "postcode_localities")
      List<String> postcodeLocalities,
      @HiveField(5) Geometry? geometry,
      @HiveField(6) @JsonKey(name: "partial_match") bool partialMatch});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$GeocodingResultImplCopyWithImpl<$Res>
    extends _$GeocodingResultCopyWithImpl<$Res, _$GeocodingResultImpl>
    implements _$$GeocodingResultImplCopyWith<$Res> {
  __$$GeocodingResultImplCopyWithImpl(
      _$GeocodingResultImpl _value, $Res Function(_$GeocodingResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
    Object? placeId = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? postcodeLocalities = null,
    Object? geometry = freezed,
    Object? partialMatch = null,
  }) {
    return _then(_$GeocodingResultImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _value._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>,
      postcodeLocalities: null == postcodeLocalities
          ? _value._postcodeLocalities
          : postcodeLocalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      partialMatch: null == partialMatch
          ? _value.partialMatch
          : partialMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodingResultImpl implements _GeocodingResult {
  _$GeocodingResultImpl(
      {@HiveField(0) required final List<String> types,
      @HiveField(1) @JsonKey(name: "place_id") required this.placeId,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      this.formattedAddress = null,
      @HiveField(3)
      @JsonKey(name: "address_components")
      final List<AddressComponent> addressComponents = const [],
      @HiveField(4)
      @JsonKey(name: "postcode_localities")
      final List<String> postcodeLocalities = const [],
      @HiveField(5) this.geometry = null,
      @HiveField(6) @JsonKey(name: "partial_match") this.partialMatch = false})
      : _types = types,
        _addressComponents = addressComponents,
        _postcodeLocalities = postcodeLocalities;

  factory _$GeocodingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodingResultImplFromJson(json);

  final List<String> _types;
  @override
  @HiveField(0)
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  @HiveField(1)
  @JsonKey(name: "place_id")
  final String? placeId;
  @override
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  final String? formattedAddress;
  final List<AddressComponent> _addressComponents;
  @override
  @HiveField(3)
  @JsonKey(name: "address_components")
  List<AddressComponent> get addressComponents {
    if (_addressComponents is EqualUnmodifiableListView)
      return _addressComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressComponents);
  }

  final List<String> _postcodeLocalities;
  @override
  @HiveField(4)
  @JsonKey(name: "postcode_localities")
  List<String> get postcodeLocalities {
    if (_postcodeLocalities is EqualUnmodifiableListView)
      return _postcodeLocalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postcodeLocalities);
  }

  @override
  @JsonKey()
  @HiveField(5)
  final Geometry? geometry;
  @override
  @HiveField(6)
  @JsonKey(name: "partial_match")
  final bool partialMatch;

  @override
  String toString() {
    return 'GeocodingResult(types: $types, placeId: $placeId, formattedAddress: $formattedAddress, addressComponents: $addressComponents, postcodeLocalities: $postcodeLocalities, geometry: $geometry, partialMatch: $partialMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodingResultImpl &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            const DeepCollectionEquality()
                .equals(other._postcodeLocalities, _postcodeLocalities) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.partialMatch, partialMatch) ||
                other.partialMatch == partialMatch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_types),
      placeId,
      formattedAddress,
      const DeepCollectionEquality().hash(_addressComponents),
      const DeepCollectionEquality().hash(_postcodeLocalities),
      geometry,
      partialMatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodingResultImplCopyWith<_$GeocodingResultImpl> get copyWith =>
      __$$GeocodingResultImplCopyWithImpl<_$GeocodingResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodingResultImplToJson(
      this,
    );
  }
}

abstract class _GeocodingResult implements GeocodingResult {
  factory _GeocodingResult(
      {@HiveField(0) required final List<String> types,
      @HiveField(1) @JsonKey(name: "place_id") required final String? placeId,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      final String? formattedAddress,
      @HiveField(3)
      @JsonKey(name: "address_components")
      final List<AddressComponent> addressComponents,
      @HiveField(4)
      @JsonKey(name: "postcode_localities")
      final List<String> postcodeLocalities,
      @HiveField(5) final Geometry? geometry,
      @HiveField(6)
      @JsonKey(name: "partial_match")
      final bool partialMatch}) = _$GeocodingResultImpl;

  factory _GeocodingResult.fromJson(Map<String, dynamic> json) =
      _$GeocodingResultImpl.fromJson;

  @override
  @HiveField(0)
  List<String> get types;
  @override
  @HiveField(1)
  @JsonKey(name: "place_id")
  String? get placeId;
  @override
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  String? get formattedAddress;
  @override
  @HiveField(3)
  @JsonKey(name: "address_components")
  List<AddressComponent> get addressComponents;
  @override
  @HiveField(4)
  @JsonKey(name: "postcode_localities")
  List<String> get postcodeLocalities;
  @override
  @HiveField(5)
  Geometry? get geometry;
  @override
  @HiveField(6)
  @JsonKey(name: "partial_match")
  bool get partialMatch;
  @override
  @JsonKey(ignore: true)
  _$$GeocodingResultImplCopyWith<_$GeocodingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
