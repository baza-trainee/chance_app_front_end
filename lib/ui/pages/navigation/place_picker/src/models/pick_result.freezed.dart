// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PickResult _$PickResultFromJson(Map<String, dynamic> json) {
  return _PickResult.fromJson(json);
}

/// @nodoc
mixin _$PickResult {
  @HiveField(0)
  @JsonKey(name: "place_id")
  String? get placeId => throw _privateConstructorUsedError;
  @HiveField(1)
  Geometry? get geometry => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  String? get formattedAddress => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String>? get types => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "address_components")
  List<AddressComponent>? get addressComponents =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "adr_address")
  String? get adrAddress => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "formatted_phone_number")
  String? get formattedPhoneNumber => throw _privateConstructorUsedError;
  @HiveField(7)
  String get id => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get reference => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get icon => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: "international_phone_number")
  String? get internationalPhoneNumber => throw _privateConstructorUsedError;
  @HiveField(15)
  num? get rating => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get scope => throw _privateConstructorUsedError;
  @HiveField(17)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(18)
  String? get vicinity => throw _privateConstructorUsedError;
  @HiveField(19)
  @JsonKey(name: "utc_offset")
  num? get utcOffset => throw _privateConstructorUsedError;
  @HiveField(20)
  String? get website => throw _privateConstructorUsedError;
  @HiveField(22)
  bool get star => throw _privateConstructorUsedError;
  @HiveField(23)
  @JsonKey(name: "is_recently_searched")
  bool get isRecentlySearched => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickResultCopyWith<PickResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickResultCopyWith<$Res> {
  factory $PickResultCopyWith(
          PickResult value, $Res Function(PickResult) then) =
      _$PickResultCopyWithImpl<$Res, PickResult>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "place_id") String? placeId,
      @HiveField(1) Geometry? geometry,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      String? formattedAddress,
      @HiveField(3) List<String>? types,
      @HiveField(4)
      @JsonKey(name: "address_components")
      List<AddressComponent>? addressComponents,
      @HiveField(5) @JsonKey(name: "adr_address") String? adrAddress,
      @HiveField(6)
      @JsonKey(name: "formatted_phone_number")
      String? formattedPhoneNumber,
      @HiveField(7) String id,
      @HiveField(8) String? reference,
      @HiveField(9) String? icon,
      @HiveField(10) String? name,
      @HiveField(13)
      @JsonKey(name: "international_phone_number")
      String? internationalPhoneNumber,
      @HiveField(15) num? rating,
      @HiveField(16) String? scope,
      @HiveField(17) String? url,
      @HiveField(18) String? vicinity,
      @HiveField(19) @JsonKey(name: "utc_offset") num? utcOffset,
      @HiveField(20) String? website,
      @HiveField(22) bool star,
      @HiveField(23)
      @JsonKey(name: "is_recently_searched")
      bool isRecentlySearched});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$PickResultCopyWithImpl<$Res, $Val extends PickResult>
    implements $PickResultCopyWith<$Res> {
  _$PickResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? geometry = freezed,
    Object? formattedAddress = freezed,
    Object? types = freezed,
    Object? addressComponents = freezed,
    Object? adrAddress = freezed,
    Object? formattedPhoneNumber = freezed,
    Object? id = null,
    Object? reference = freezed,
    Object? icon = freezed,
    Object? name = freezed,
    Object? internationalPhoneNumber = freezed,
    Object? rating = freezed,
    Object? scope = freezed,
    Object? url = freezed,
    Object? vicinity = freezed,
    Object? utcOffset = freezed,
    Object? website = freezed,
    Object? star = null,
    Object? isRecentlySearched = null,
  }) {
    return _then(_value.copyWith(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      addressComponents: freezed == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      adrAddress: freezed == adrAddress
          ? _value.adrAddress
          : adrAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      vicinity: freezed == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String?,
      utcOffset: freezed == utcOffset
          ? _value.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as num?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecentlySearched: null == isRecentlySearched
          ? _value.isRecentlySearched
          : isRecentlySearched // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PickResultImplCopyWith<$Res>
    implements $PickResultCopyWith<$Res> {
  factory _$$PickResultImplCopyWith(
          _$PickResultImpl value, $Res Function(_$PickResultImpl) then) =
      __$$PickResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "place_id") String? placeId,
      @HiveField(1) Geometry? geometry,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      String? formattedAddress,
      @HiveField(3) List<String>? types,
      @HiveField(4)
      @JsonKey(name: "address_components")
      List<AddressComponent>? addressComponents,
      @HiveField(5) @JsonKey(name: "adr_address") String? adrAddress,
      @HiveField(6)
      @JsonKey(name: "formatted_phone_number")
      String? formattedPhoneNumber,
      @HiveField(7) String id,
      @HiveField(8) String? reference,
      @HiveField(9) String? icon,
      @HiveField(10) String? name,
      @HiveField(13)
      @JsonKey(name: "international_phone_number")
      String? internationalPhoneNumber,
      @HiveField(15) num? rating,
      @HiveField(16) String? scope,
      @HiveField(17) String? url,
      @HiveField(18) String? vicinity,
      @HiveField(19) @JsonKey(name: "utc_offset") num? utcOffset,
      @HiveField(20) String? website,
      @HiveField(22) bool star,
      @HiveField(23)
      @JsonKey(name: "is_recently_searched")
      bool isRecentlySearched});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$PickResultImplCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickResultImpl>
    implements _$$PickResultImplCopyWith<$Res> {
  __$$PickResultImplCopyWithImpl(
      _$PickResultImpl _value, $Res Function(_$PickResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? geometry = freezed,
    Object? formattedAddress = freezed,
    Object? types = freezed,
    Object? addressComponents = freezed,
    Object? adrAddress = freezed,
    Object? formattedPhoneNumber = freezed,
    Object? id = null,
    Object? reference = freezed,
    Object? icon = freezed,
    Object? name = freezed,
    Object? internationalPhoneNumber = freezed,
    Object? rating = freezed,
    Object? scope = freezed,
    Object? url = freezed,
    Object? vicinity = freezed,
    Object? utcOffset = freezed,
    Object? website = freezed,
    Object? star = null,
    Object? isRecentlySearched = null,
  }) {
    return _then(_$PickResultImpl(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      addressComponents: freezed == addressComponents
          ? _value._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      adrAddress: freezed == adrAddress
          ? _value.adrAddress
          : adrAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      vicinity: freezed == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String?,
      utcOffset: freezed == utcOffset
          ? _value.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as num?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecentlySearched: null == isRecentlySearched
          ? _value.isRecentlySearched
          : isRecentlySearched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickResultImpl implements _PickResult {
  _$PickResultImpl(
      {@HiveField(0) @JsonKey(name: "place_id") this.placeId = null,
      @HiveField(1) this.geometry = null,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      this.formattedAddress = null,
      @HiveField(3) final List<String>? types = null,
      @HiveField(4)
      @JsonKey(name: "address_components")
      final List<AddressComponent>? addressComponents = null,
      @HiveField(5) @JsonKey(name: "adr_address") this.adrAddress = null,
      @HiveField(6)
      @JsonKey(name: "formatted_phone_number")
      this.formattedPhoneNumber = null,
      @HiveField(7) required this.id,
      @HiveField(8) this.reference = null,
      @HiveField(9) this.icon = null,
      @HiveField(10) this.name = null,
      @HiveField(13)
      @JsonKey(name: "international_phone_number")
      this.internationalPhoneNumber = null,
      @HiveField(15) this.rating = null,
      @HiveField(16) this.scope = null,
      @HiveField(17) this.url = null,
      @HiveField(18) this.vicinity = null,
      @HiveField(19) @JsonKey(name: "utc_offset") this.utcOffset = null,
      @HiveField(20) this.website = null,
      @HiveField(22) this.star = false,
      @HiveField(23)
      @JsonKey(name: "is_recently_searched")
      this.isRecentlySearched = true})
      : _types = types,
        _addressComponents = addressComponents;

  factory _$PickResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickResultImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "place_id")
  final String? placeId;
  @override
  @JsonKey()
  @HiveField(1)
  final Geometry? geometry;
  @override
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  final String? formattedAddress;
  final List<String>? _types;
  @override
  @JsonKey()
  @HiveField(3)
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressComponent>? _addressComponents;
  @override
  @HiveField(4)
  @JsonKey(name: "address_components")
  List<AddressComponent>? get addressComponents {
    final value = _addressComponents;
    if (value == null) return null;
    if (_addressComponents is EqualUnmodifiableListView)
      return _addressComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(5)
  @JsonKey(name: "adr_address")
  final String? adrAddress;
  @override
  @HiveField(6)
  @JsonKey(name: "formatted_phone_number")
  final String? formattedPhoneNumber;
  @override
  @HiveField(7)
  final String id;
  @override
  @JsonKey()
  @HiveField(8)
  final String? reference;
  @override
  @JsonKey()
  @HiveField(9)
  final String? icon;
  @override
  @JsonKey()
  @HiveField(10)
  final String? name;
  @override
  @HiveField(13)
  @JsonKey(name: "international_phone_number")
  final String? internationalPhoneNumber;
  @override
  @JsonKey()
  @HiveField(15)
  final num? rating;
  @override
  @JsonKey()
  @HiveField(16)
  final String? scope;
  @override
  @JsonKey()
  @HiveField(17)
  final String? url;
  @override
  @JsonKey()
  @HiveField(18)
  final String? vicinity;
  @override
  @HiveField(19)
  @JsonKey(name: "utc_offset")
  final num? utcOffset;
  @override
  @JsonKey()
  @HiveField(20)
  final String? website;
  @override
  @JsonKey()
  @HiveField(22)
  final bool star;
  @override
  @HiveField(23)
  @JsonKey(name: "is_recently_searched")
  final bool isRecentlySearched;

  @override
  String toString() {
    return 'PickResult(placeId: $placeId, geometry: $geometry, formattedAddress: $formattedAddress, types: $types, addressComponents: $addressComponents, adrAddress: $adrAddress, formattedPhoneNumber: $formattedPhoneNumber, id: $id, reference: $reference, icon: $icon, name: $name, internationalPhoneNumber: $internationalPhoneNumber, rating: $rating, scope: $scope, url: $url, vicinity: $vicinity, utcOffset: $utcOffset, website: $website, star: $star, isRecentlySearched: $isRecentlySearched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickResultImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            (identical(other.adrAddress, adrAddress) ||
                other.adrAddress == adrAddress) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(
                    other.internationalPhoneNumber, internationalPhoneNumber) ||
                other.internationalPhoneNumber == internationalPhoneNumber) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.utcOffset, utcOffset) ||
                other.utcOffset == utcOffset) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.isRecentlySearched, isRecentlySearched) ||
                other.isRecentlySearched == isRecentlySearched));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        placeId,
        geometry,
        formattedAddress,
        const DeepCollectionEquality().hash(_types),
        const DeepCollectionEquality().hash(_addressComponents),
        adrAddress,
        formattedPhoneNumber,
        id,
        reference,
        icon,
        name,
        internationalPhoneNumber,
        rating,
        scope,
        url,
        vicinity,
        utcOffset,
        website,
        star,
        isRecentlySearched
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickResultImplCopyWith<_$PickResultImpl> get copyWith =>
      __$$PickResultImplCopyWithImpl<_$PickResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickResultImplToJson(
      this,
    );
  }
}

abstract class _PickResult implements PickResult {
  factory _PickResult(
      {@HiveField(0) @JsonKey(name: "place_id") final String? placeId,
      @HiveField(1) final Geometry? geometry,
      @HiveField(2)
      @JsonKey(name: "formatted_address")
      final String? formattedAddress,
      @HiveField(3) final List<String>? types,
      @HiveField(4)
      @JsonKey(name: "address_components")
      final List<AddressComponent>? addressComponents,
      @HiveField(5) @JsonKey(name: "adr_address") final String? adrAddress,
      @HiveField(6)
      @JsonKey(name: "formatted_phone_number")
      final String? formattedPhoneNumber,
      @HiveField(7) required final String id,
      @HiveField(8) final String? reference,
      @HiveField(9) final String? icon,
      @HiveField(10) final String? name,
      @HiveField(13)
      @JsonKey(name: "international_phone_number")
      final String? internationalPhoneNumber,
      @HiveField(15) final num? rating,
      @HiveField(16) final String? scope,
      @HiveField(17) final String? url,
      @HiveField(18) final String? vicinity,
      @HiveField(19) @JsonKey(name: "utc_offset") final num? utcOffset,
      @HiveField(20) final String? website,
      @HiveField(22) final bool star,
      @HiveField(23)
      @JsonKey(name: "is_recently_searched")
      final bool isRecentlySearched}) = _$PickResultImpl;

  factory _PickResult.fromJson(Map<String, dynamic> json) =
      _$PickResultImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "place_id")
  String? get placeId;
  @override
  @HiveField(1)
  Geometry? get geometry;
  @override
  @HiveField(2)
  @JsonKey(name: "formatted_address")
  String? get formattedAddress;
  @override
  @HiveField(3)
  List<String>? get types;
  @override
  @HiveField(4)
  @JsonKey(name: "address_components")
  List<AddressComponent>? get addressComponents;
  @override
  @HiveField(5)
  @JsonKey(name: "adr_address")
  String? get adrAddress;
  @override
  @HiveField(6)
  @JsonKey(name: "formatted_phone_number")
  String? get formattedPhoneNumber;
  @override
  @HiveField(7)
  String get id;
  @override
  @HiveField(8)
  String? get reference;
  @override
  @HiveField(9)
  String? get icon;
  @override
  @HiveField(10)
  String? get name;
  @override
  @HiveField(13)
  @JsonKey(name: "international_phone_number")
  String? get internationalPhoneNumber;
  @override
  @HiveField(15)
  num? get rating;
  @override
  @HiveField(16)
  String? get scope;
  @override
  @HiveField(17)
  String? get url;
  @override
  @HiveField(18)
  String? get vicinity;
  @override
  @HiveField(19)
  @JsonKey(name: "utc_offset")
  num? get utcOffset;
  @override
  @HiveField(20)
  String? get website;
  @override
  @HiveField(22)
  bool get star;
  @override
  @HiveField(23)
  @JsonKey(name: "is_recently_searched")
  bool get isRecentlySearched;
  @override
  @JsonKey(ignore: true)
  _$$PickResultImplCopyWith<_$PickResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
