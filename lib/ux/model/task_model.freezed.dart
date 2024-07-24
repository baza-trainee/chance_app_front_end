// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get message => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isDone => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get remindBefore => throw _privateConstructorUsedError; // in minutes
  @HiveField(5)
  bool get isRemoved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) String message,
      @HiveField(2) DateTime date,
      @HiveField(3) bool isDone,
      @HiveField(4) int? remindBefore,
      @HiveField(5) bool isRemoved});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? date = null,
    Object? isDone = null,
    Object? remindBefore = freezed,
    Object? isRemoved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: freezed == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) String message,
      @HiveField(2) DateTime date,
      @HiveField(3) bool isDone,
      @HiveField(4) int? remindBefore,
      @HiveField(5) bool isRemoved});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? date = null,
    Object? isDone = null,
    Object? remindBefore = freezed,
    Object? isRemoved = null,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      remindBefore: freezed == remindBefore
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl extends _TaskModel {
  const _$TaskModelImpl(
      {@HiveField(0) @JsonKey(name: "_id") required this.id,
      @HiveField(1) required this.message,
      @HiveField(2) required this.date,
      @HiveField(3) this.isDone = false,
      @HiveField(4) this.remindBefore,
      @HiveField(5) this.isRemoved = false})
      : super._();

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  final String id;
  @override
  @HiveField(1)
  final String message;
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @JsonKey()
  @HiveField(3)
  final bool isDone;
  @override
  @HiveField(4)
  final int? remindBefore;
// in minutes
  @override
  @JsonKey()
  @HiveField(5)
  final bool isRemoved;

  @override
  String toString() {
    return 'TaskModel(id: $id, message: $message, date: $date, isDone: $isDone, remindBefore: $remindBefore, isRemoved: $isRemoved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.remindBefore, remindBefore) ||
                other.remindBefore == remindBefore) &&
            (identical(other.isRemoved, isRemoved) ||
                other.isRemoved == isRemoved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, message, date, isDone, remindBefore, isRemoved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel extends TaskModel {
  const factory _TaskModel(
      {@HiveField(0) @JsonKey(name: "_id") required final String id,
      @HiveField(1) required final String message,
      @HiveField(2) required final DateTime date,
      @HiveField(3) final bool isDone,
      @HiveField(4) final int? remindBefore,
      @HiveField(5) final bool isRemoved}) = _$TaskModelImpl;
  const _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id;
  @override
  @HiveField(1)
  String get message;
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  bool get isDone;
  @override
  @HiveField(4)
  int? get remindBefore;
  @override // in minutes
  @HiveField(5)
  bool get isRemoved;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
