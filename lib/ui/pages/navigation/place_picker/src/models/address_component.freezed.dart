// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) {
  return _AddressComponent.fromJson(json);
}

/// @nodoc
mixin _$AddressComponent {
  @HiveField(0)
  List<String> get types => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "long_name")
  String get longName => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "short_name")
  String get shortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressComponentCopyWith<AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressComponentCopyWith<$Res> {
  factory $AddressComponentCopyWith(
          AddressComponent value, $Res Function(AddressComponent) then) =
      _$AddressComponentCopyWithImpl<$Res, AddressComponent>;
  @useResult
  $Res call(
      {@HiveField(0) List<String> types,
      @HiveField(1) @JsonKey(name: "long_name") String longName,
      @HiveField(2) @JsonKey(name: "short_name") String shortName});
}

/// @nodoc
class _$AddressComponentCopyWithImpl<$Res, $Val extends AddressComponent>
    implements $AddressComponentCopyWith<$Res> {
  _$AddressComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
    Object? longName = null,
    Object? shortName = null,
  }) {
    return _then(_value.copyWith(
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressComponentImplCopyWith<$Res>
    implements $AddressComponentCopyWith<$Res> {
  factory _$$AddressComponentImplCopyWith(_$AddressComponentImpl value,
          $Res Function(_$AddressComponentImpl) then) =
      __$$AddressComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String> types,
      @HiveField(1) @JsonKey(name: "long_name") String longName,
      @HiveField(2) @JsonKey(name: "short_name") String shortName});
}

/// @nodoc
class __$$AddressComponentImplCopyWithImpl<$Res>
    extends _$AddressComponentCopyWithImpl<$Res, _$AddressComponentImpl>
    implements _$$AddressComponentImplCopyWith<$Res> {
  __$$AddressComponentImplCopyWithImpl(_$AddressComponentImpl _value,
      $Res Function(_$AddressComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
    Object? longName = null,
    Object? shortName = null,
  }) {
    return _then(_$AddressComponentImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressComponentImpl implements _AddressComponent {
  const _$AddressComponentImpl(
      {@HiveField(0) required final List<String> types,
      @HiveField(1) @JsonKey(name: "long_name") required this.longName,
      @HiveField(2) @JsonKey(name: "short_name") required this.shortName})
      : _types = types;

  factory _$AddressComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressComponentImplFromJson(json);

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
  @JsonKey(name: "long_name")
  final String longName;
  @override
  @HiveField(2)
  @JsonKey(name: "short_name")
  final String shortName;

  @override
  String toString() {
    return 'AddressComponent(types: $types, longName: $longName, shortName: $shortName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressComponentImpl &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_types), longName, shortName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressComponentImplCopyWith<_$AddressComponentImpl> get copyWith =>
      __$$AddressComponentImplCopyWithImpl<_$AddressComponentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressComponentImplToJson(
      this,
    );
  }
}

abstract class _AddressComponent implements AddressComponent {
  const factory _AddressComponent(
      {@HiveField(0) required final List<String> types,
      @HiveField(1) @JsonKey(name: "long_name") required final String longName,
      @HiveField(2)
      @JsonKey(name: "short_name")
      required final String shortName}) = _$AddressComponentImpl;

  factory _AddressComponent.fromJson(Map<String, dynamic> json) =
      _$AddressComponentImpl.fromJson;

  @override
  @HiveField(0)
  List<String> get types;
  @override
  @HiveField(1)
  @JsonKey(name: "long_name")
  String get longName;
  @override
  @HiveField(2)
  @JsonKey(name: "short_name")
  String get shortName;
  @override
  @JsonKey(ignore: true)
  _$$AddressComponentImplCopyWith<_$AddressComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
