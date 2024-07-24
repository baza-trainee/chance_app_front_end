// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosContactModel _$SosContactModelFromJson(Map<String, dynamic> json) {
  return _ContactModel.fromJson(json);
}

/// @nodoc
mixin _$SosContactModel {
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get phone => throw _privateConstructorUsedError;
  @HiveField(3)
  String get groupName => throw _privateConstructorUsedError;
  @HiveField(4)
  String get id => throw _privateConstructorUsedError;
  @HiveField(5)
  String get contactsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosContactModelCopyWith<SosContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosContactModelCopyWith<$Res> {
  factory $SosContactModelCopyWith(
          SosContactModel value, $Res Function(SosContactModel) then) =
      _$SosContactModelCopyWithImpl<$Res, SosContactModel>;
  @useResult
  $Res call(
      {@HiveField(1) String name,
      @HiveField(2) String phone,
      @HiveField(3) String groupName,
      @HiveField(4) String id,
      @HiveField(5) String contactsId});
}

/// @nodoc
class _$SosContactModelCopyWithImpl<$Res, $Val extends SosContactModel>
    implements $SosContactModelCopyWith<$Res> {
  _$SosContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? groupName = null,
    Object? id = null,
    Object? contactsId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contactsId: null == contactsId
          ? _value.contactsId
          : contactsId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactModelImplCopyWith<$Res>
    implements $SosContactModelCopyWith<$Res> {
  factory _$$ContactModelImplCopyWith(
          _$ContactModelImpl value, $Res Function(_$ContactModelImpl) then) =
      __$$ContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String name,
      @HiveField(2) String phone,
      @HiveField(3) String groupName,
      @HiveField(4) String id,
      @HiveField(5) String contactsId});
}

/// @nodoc
class __$$ContactModelImplCopyWithImpl<$Res>
    extends _$SosContactModelCopyWithImpl<$Res, _$ContactModelImpl>
    implements _$$ContactModelImplCopyWith<$Res> {
  __$$ContactModelImplCopyWithImpl(
      _$ContactModelImpl _value, $Res Function(_$ContactModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? groupName = null,
    Object? id = null,
    Object? contactsId = null,
  }) {
    return _then(_$ContactModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contactsId: null == contactsId
          ? _value.contactsId
          : contactsId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$ContactModelImpl implements _ContactModel {
  const _$ContactModelImpl(
      {@HiveField(1) required this.name,
      @HiveField(2) required this.phone,
      @HiveField(3) this.groupName = "",
      @HiveField(4) this.id = "",
      @HiveField(5) this.contactsId = ""});

  factory _$ContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactModelImplFromJson(json);

  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String phone;
  @override
  @JsonKey()
  @HiveField(3)
  final String groupName;
  @override
  @JsonKey()
  @HiveField(4)
  final String id;
  @override
  @JsonKey()
  @HiveField(5)
  final String contactsId;

  @override
  String toString() {
    return 'SosContactModel(name: $name, phone: $phone, groupName: $groupName, id: $id, contactsId: $contactsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contactsId, contactsId) ||
                other.contactsId == contactsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phone, groupName, id, contactsId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      __$$ContactModelImplCopyWithImpl<_$ContactModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactModelImplToJson(
      this,
    );
  }
}

abstract class _ContactModel implements SosContactModel {
  const factory _ContactModel(
      {@HiveField(1) required final String name,
      @HiveField(2) required final String phone,
      @HiveField(3) final String groupName,
      @HiveField(4) final String id,
      @HiveField(5) final String contactsId}) = _$ContactModelImpl;

  factory _ContactModel.fromJson(Map<String, dynamic> json) =
      _$ContactModelImpl.fromJson;

  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get phone;
  @override
  @HiveField(3)
  String get groupName;
  @override
  @HiveField(4)
  String get id;
  @override
  @HiveField(5)
  String get contactsId;
  @override
  @JsonKey(ignore: true)
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SosGroupModel _$SosGroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$SosGroupModel {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  List<SosContactModel> get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosGroupModelCopyWith<SosGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosGroupModelCopyWith<$Res> {
  factory $SosGroupModelCopyWith(
          SosGroupModel value, $Res Function(SosGroupModel) then) =
      _$SosGroupModelCopyWithImpl<$Res, SosGroupModel>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String name,
      @HiveField(3) List<SosContactModel> contacts});
}

/// @nodoc
class _$SosGroupModelCopyWithImpl<$Res, $Val extends SosGroupModel>
    implements $SosGroupModelCopyWith<$Res> {
  _$SosGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contacts = null,
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
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<SosContactModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupModelImplCopyWith<$Res>
    implements $SosGroupModelCopyWith<$Res> {
  factory _$$GroupModelImplCopyWith(
          _$GroupModelImpl value, $Res Function(_$GroupModelImpl) then) =
      __$$GroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String name,
      @HiveField(3) List<SosContactModel> contacts});
}

/// @nodoc
class __$$GroupModelImplCopyWithImpl<$Res>
    extends _$SosGroupModelCopyWithImpl<$Res, _$GroupModelImpl>
    implements _$$GroupModelImplCopyWith<$Res> {
  __$$GroupModelImplCopyWithImpl(
      _$GroupModelImpl _value, $Res Function(_$GroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contacts = null,
  }) {
    return _then(_$GroupModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<SosContactModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$GroupModelImpl implements _GroupModel {
  const _$GroupModelImpl(
      {@HiveField(1) this.id = "",
      @HiveField(2) required this.name,
      @HiveField(3) required final List<SosContactModel> contacts})
      : _contacts = contacts;

  factory _$GroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String name;
  final List<SosContactModel> _contacts;
  @override
  @HiveField(3)
  List<SosContactModel> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'SosGroupModel(id: $id, name: $name, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      __$$GroupModelImplCopyWithImpl<_$GroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupModelImplToJson(
      this,
    );
  }
}

abstract class _GroupModel implements SosGroupModel {
  const factory _GroupModel(
          {@HiveField(1) final String id,
          @HiveField(2) required final String name,
          @HiveField(3) required final List<SosContactModel> contacts}) =
      _$GroupModelImpl;

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$GroupModelImpl.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  List<SosContactModel> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
