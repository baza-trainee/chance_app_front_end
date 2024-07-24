// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'me_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeUser _$MeUserFromJson(Map<String, dynamic> json) {
  return _MeUser.fromJson(json);
}

/// @nodoc
mixin _$MeUser {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get phone => throw _privateConstructorUsedError;
  @HiveField(4)
  String get email => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isGoogle => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get isConfirmed => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get deviceId => throw _privateConstructorUsedError;
  @HiveField(8)
  int get mapType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeUserCopyWith<MeUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeUserCopyWith<$Res> {
  factory $MeUserCopyWith(MeUser value, $Res Function(MeUser) then) =
      _$MeUserCopyWithImpl<$Res, MeUser>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String lastName,
      @HiveField(3) String phone,
      @HiveField(4) String email,
      @HiveField(5) bool isGoogle,
      @HiveField(6) bool isConfirmed,
      @HiveField(7) String? deviceId,
      @HiveField(8) int mapType});
}

/// @nodoc
class _$MeUserCopyWithImpl<$Res, $Val extends MeUser>
    implements $MeUserCopyWith<$Res> {
  _$MeUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
    Object? isGoogle = null,
    Object? isConfirmed = null,
    Object? deviceId = freezed,
    Object? mapType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isGoogle: null == isGoogle
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmed: null == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeUserImplCopyWith<$Res> implements $MeUserCopyWith<$Res> {
  factory _$$MeUserImplCopyWith(
          _$MeUserImpl value, $Res Function(_$MeUserImpl) then) =
      __$$MeUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String lastName,
      @HiveField(3) String phone,
      @HiveField(4) String email,
      @HiveField(5) bool isGoogle,
      @HiveField(6) bool isConfirmed,
      @HiveField(7) String? deviceId,
      @HiveField(8) int mapType});
}

/// @nodoc
class __$$MeUserImplCopyWithImpl<$Res>
    extends _$MeUserCopyWithImpl<$Res, _$MeUserImpl>
    implements _$$MeUserImplCopyWith<$Res> {
  __$$MeUserImplCopyWithImpl(
      _$MeUserImpl _value, $Res Function(_$MeUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
    Object? isGoogle = null,
    Object? isConfirmed = null,
    Object? deviceId = freezed,
    Object? mapType = null,
  }) {
    return _then(_$MeUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isGoogle: null == isGoogle
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmed: null == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeUserImpl implements _MeUser {
  const _$MeUserImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) this.name = "",
      @HiveField(2) this.lastName = "",
      @HiveField(3) this.phone = "",
      @HiveField(4) this.email = "",
      @HiveField(5) this.isGoogle = false,
      @HiveField(6) this.isConfirmed = false,
      @HiveField(7) this.deviceId = null,
      @HiveField(8) this.mapType = 0});

  factory _$MeUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeUserImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @JsonKey()
  @HiveField(1)
  final String name;
  @override
  @JsonKey()
  @HiveField(2)
  final String lastName;
  @override
  @JsonKey()
  @HiveField(3)
  final String phone;
  @override
  @JsonKey()
  @HiveField(4)
  final String email;
  @override
  @JsonKey()
  @HiveField(5)
  final bool isGoogle;
  @override
  @JsonKey()
  @HiveField(6)
  final bool isConfirmed;
  @override
  @JsonKey()
  @HiveField(7)
  final String? deviceId;
  @override
  @JsonKey()
  @HiveField(8)
  final int mapType;

  @override
  String toString() {
    return 'MeUser(id: $id, name: $name, lastName: $lastName, phone: $phone, email: $email, isGoogle: $isGoogle, isConfirmed: $isConfirmed, deviceId: $deviceId, mapType: $mapType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isGoogle, isGoogle) ||
                other.isGoogle == isGoogle) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.mapType, mapType) || other.mapType == mapType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lastName, phone, email,
      isGoogle, isConfirmed, deviceId, mapType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeUserImplCopyWith<_$MeUserImpl> get copyWith =>
      __$$MeUserImplCopyWithImpl<_$MeUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeUserImplToJson(
      this,
    );
  }
}

abstract class _MeUser implements MeUser {
  const factory _MeUser(
      {@HiveField(0) required final String id,
      @HiveField(1) final String name,
      @HiveField(2) final String lastName,
      @HiveField(3) final String phone,
      @HiveField(4) final String email,
      @HiveField(5) final bool isGoogle,
      @HiveField(6) final bool isConfirmed,
      @HiveField(7) final String? deviceId,
      @HiveField(8) final int mapType}) = _$MeUserImpl;

  factory _MeUser.fromJson(Map<String, dynamic> json) = _$MeUserImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get lastName;
  @override
  @HiveField(3)
  String get phone;
  @override
  @HiveField(4)
  String get email;
  @override
  @HiveField(5)
  bool get isGoogle;
  @override
  @HiveField(6)
  bool get isConfirmed;
  @override
  @HiveField(7)
  String? get deviceId;
  @override
  @HiveField(8)
  int get mapType;
  @override
  @JsonKey(ignore: true)
  _$$MeUserImplCopyWith<_$MeUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
