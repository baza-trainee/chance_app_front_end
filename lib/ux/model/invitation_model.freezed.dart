// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationModel _$InvitationModelFromJson(Map<String, dynamic> json) {
  return _InvitationModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get toUserEmail => throw _privateConstructorUsedError;
  @HiveField(2)
  String get toUserName => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get sentDate => throw _privateConstructorUsedError;
  @HiveField(4)
  String get fromUserEmail => throw _privateConstructorUsedError;
  @HiveField(5)
  String get fromUserName => throw _privateConstructorUsedError;
  @HiveField(6)
  InvitationStatus get invitationStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationModelCopyWith<InvitationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationModelCopyWith<$Res> {
  factory $InvitationModelCopyWith(
          InvitationModel value, $Res Function(InvitationModel) then) =
      _$InvitationModelCopyWithImpl<$Res, InvitationModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String toUserEmail,
      @HiveField(2) String toUserName,
      @HiveField(3) DateTime? sentDate,
      @HiveField(4) String fromUserEmail,
      @HiveField(5) String fromUserName,
      @HiveField(6) InvitationStatus invitationStatus});
}

/// @nodoc
class _$InvitationModelCopyWithImpl<$Res, $Val extends InvitationModel>
    implements $InvitationModelCopyWith<$Res> {
  _$InvitationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toUserEmail = null,
    Object? toUserName = null,
    Object? sentDate = freezed,
    Object? fromUserEmail = null,
    Object? fromUserName = null,
    Object? invitationStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      toUserEmail: null == toUserEmail
          ? _value.toUserEmail
          : toUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      toUserName: null == toUserName
          ? _value.toUserName
          : toUserName // ignore: cast_nullable_to_non_nullable
              as String,
      sentDate: freezed == sentDate
          ? _value.sentDate
          : sentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromUserEmail: null == fromUserEmail
          ? _value.fromUserEmail
          : fromUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserName: null == fromUserName
          ? _value.fromUserName
          : fromUserName // ignore: cast_nullable_to_non_nullable
              as String,
      invitationStatus: null == invitationStatus
          ? _value.invitationStatus
          : invitationStatus // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationModelImplCopyWith<$Res>
    implements $InvitationModelCopyWith<$Res> {
  factory _$$InvitationModelImplCopyWith(_$InvitationModelImpl value,
          $Res Function(_$InvitationModelImpl) then) =
      __$$InvitationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String toUserEmail,
      @HiveField(2) String toUserName,
      @HiveField(3) DateTime? sentDate,
      @HiveField(4) String fromUserEmail,
      @HiveField(5) String fromUserName,
      @HiveField(6) InvitationStatus invitationStatus});
}

/// @nodoc
class __$$InvitationModelImplCopyWithImpl<$Res>
    extends _$InvitationModelCopyWithImpl<$Res, _$InvitationModelImpl>
    implements _$$InvitationModelImplCopyWith<$Res> {
  __$$InvitationModelImplCopyWithImpl(
      _$InvitationModelImpl _value, $Res Function(_$InvitationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toUserEmail = null,
    Object? toUserName = null,
    Object? sentDate = freezed,
    Object? fromUserEmail = null,
    Object? fromUserName = null,
    Object? invitationStatus = null,
  }) {
    return _then(_$InvitationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      toUserEmail: null == toUserEmail
          ? _value.toUserEmail
          : toUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      toUserName: null == toUserName
          ? _value.toUserName
          : toUserName // ignore: cast_nullable_to_non_nullable
              as String,
      sentDate: freezed == sentDate
          ? _value.sentDate
          : sentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromUserEmail: null == fromUserEmail
          ? _value.fromUserEmail
          : fromUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserName: null == fromUserName
          ? _value.fromUserName
          : fromUserName // ignore: cast_nullable_to_non_nullable
              as String,
      invitationStatus: null == invitationStatus
          ? _value.invitationStatus
          : invitationStatus // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationModelImpl implements _InvitationModel {
  const _$InvitationModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.toUserEmail,
      @HiveField(2) required this.toUserName,
      @HiveField(3) required this.sentDate,
      @HiveField(4) required this.fromUserEmail,
      @HiveField(5) required this.fromUserName,
      @HiveField(6) this.invitationStatus = InvitationStatus.pending});

  factory _$InvitationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String toUserEmail;
  @override
  @HiveField(2)
  final String toUserName;
  @override
  @HiveField(3)
  final DateTime? sentDate;
  @override
  @HiveField(4)
  final String fromUserEmail;
  @override
  @HiveField(5)
  final String fromUserName;
  @override
  @JsonKey()
  @HiveField(6)
  final InvitationStatus invitationStatus;

  @override
  String toString() {
    return 'InvitationModel(id: $id, toUserEmail: $toUserEmail, toUserName: $toUserName, sentDate: $sentDate, fromUserEmail: $fromUserEmail, fromUserName: $fromUserName, invitationStatus: $invitationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toUserEmail, toUserEmail) ||
                other.toUserEmail == toUserEmail) &&
            (identical(other.toUserName, toUserName) ||
                other.toUserName == toUserName) &&
            (identical(other.sentDate, sentDate) ||
                other.sentDate == sentDate) &&
            (identical(other.fromUserEmail, fromUserEmail) ||
                other.fromUserEmail == fromUserEmail) &&
            (identical(other.fromUserName, fromUserName) ||
                other.fromUserName == fromUserName) &&
            (identical(other.invitationStatus, invitationStatus) ||
                other.invitationStatus == invitationStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, toUserEmail, toUserName,
      sentDate, fromUserEmail, fromUserName, invitationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationModelImplCopyWith<_$InvitationModelImpl> get copyWith =>
      __$$InvitationModelImplCopyWithImpl<_$InvitationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationModel implements InvitationModel {
  const factory _InvitationModel(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String toUserEmail,
          @HiveField(2) required final String toUserName,
          @HiveField(3) required final DateTime? sentDate,
          @HiveField(4) required final String fromUserEmail,
          @HiveField(5) required final String fromUserName,
          @HiveField(6) final InvitationStatus invitationStatus}) =
      _$InvitationModelImpl;

  factory _InvitationModel.fromJson(Map<String, dynamic> json) =
      _$InvitationModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get toUserEmail;
  @override
  @HiveField(2)
  String get toUserName;
  @override
  @HiveField(3)
  DateTime? get sentDate;
  @override
  @HiveField(4)
  String get fromUserEmail;
  @override
  @HiveField(5)
  String get fromUserName;
  @override
  @HiveField(6)
  InvitationStatus get invitationStatus;
  @override
  @JsonKey(ignore: true)
  _$$InvitationModelImplCopyWith<_$InvitationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
