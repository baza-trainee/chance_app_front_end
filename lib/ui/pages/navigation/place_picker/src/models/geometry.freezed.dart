// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geometry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  @HiveField(0)
  Location get location => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "location_type")
  String? get locationType => throw _privateConstructorUsedError;
  @HiveField(2)
  Bounds? get viewport => throw _privateConstructorUsedError;
  @HiveField(3)
  Bounds? get bounds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call(
      {@HiveField(0) Location location,
      @HiveField(1) @JsonKey(name: "location_type") String? locationType,
      @HiveField(2) Bounds? viewport,
      @HiveField(3) Bounds? bounds});

  $LocationCopyWith<$Res> get location;
  $BoundsCopyWith<$Res>? get viewport;
  $BoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? locationType = freezed,
    Object? viewport = freezed,
    Object? bounds = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res>? get viewport {
    if (_value.viewport == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.viewport!, (value) {
      return _then(_value.copyWith(viewport: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeometryImplCopyWith<$Res>
    implements $GeometryCopyWith<$Res> {
  factory _$$GeometryImplCopyWith(
          _$GeometryImpl value, $Res Function(_$GeometryImpl) then) =
      __$$GeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) Location location,
      @HiveField(1) @JsonKey(name: "location_type") String? locationType,
      @HiveField(2) Bounds? viewport,
      @HiveField(3) Bounds? bounds});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $BoundsCopyWith<$Res>? get viewport;
  @override
  $BoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class __$$GeometryImplCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$GeometryImpl>
    implements _$$GeometryImplCopyWith<$Res> {
  __$$GeometryImplCopyWithImpl(
      _$GeometryImpl _value, $Res Function(_$GeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? locationType = freezed,
    Object? viewport = freezed,
    Object? bounds = freezed,
  }) {
    return _then(_$GeometryImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeometryImpl implements _Geometry {
  _$GeometryImpl(
      {@HiveField(0) required this.location,
      @HiveField(1) @JsonKey(name: "location_type") this.locationType = null,
      @HiveField(2) this.viewport = null,
      @HiveField(3) this.bounds = null});

  factory _$GeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeometryImplFromJson(json);

  @override
  @HiveField(0)
  final Location location;
  @override
  @HiveField(1)
  @JsonKey(name: "location_type")
  final String? locationType;
  @override
  @JsonKey()
  @HiveField(2)
  final Bounds? viewport;
  @override
  @JsonKey()
  @HiveField(3)
  final Bounds? bounds;

  @override
  String toString() {
    return 'Geometry(location: $location, locationType: $locationType, viewport: $viewport, bounds: $bounds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeometryImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport) &&
            (identical(other.bounds, bounds) || other.bounds == bounds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, location, locationType, viewport, bounds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      __$$GeometryImplCopyWithImpl<_$GeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeometryImplToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  factory _Geometry(
      {@HiveField(0) required final Location location,
      @HiveField(1) @JsonKey(name: "location_type") final String? locationType,
      @HiveField(2) final Bounds? viewport,
      @HiveField(3) final Bounds? bounds}) = _$GeometryImpl;

  factory _Geometry.fromJson(Map<String, dynamic> json) =
      _$GeometryImpl.fromJson;

  @override
  @HiveField(0)
  Location get location;
  @override
  @HiveField(1)
  @JsonKey(name: "location_type")
  String? get locationType;
  @override
  @HiveField(2)
  Bounds? get viewport;
  @override
  @HiveField(3)
  Bounds? get bounds;
  @override
  @JsonKey(ignore: true)
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
