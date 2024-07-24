// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_medicine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddMedicineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMedicineEventCopyWith<$Res> {
  factory $AddMedicineEventCopyWith(
          AddMedicineEvent value, $Res Function(AddMedicineEvent) then) =
      _$AddMedicineEventCopyWithImpl<$Res, AddMedicineEvent>;
}

/// @nodoc
class _$AddMedicineEventCopyWithImpl<$Res, $Val extends AddMedicineEvent>
    implements $AddMedicineEventCopyWith<$Res> {
  _$AddMedicineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetNameImplCopyWith<$Res> {
  factory _$$SetNameImplCopyWith(
          _$SetNameImpl value, $Res Function(_$SetNameImpl) then) =
      __$$SetNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SetNameImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SetNameImpl>
    implements _$$SetNameImplCopyWith<$Res> {
  __$$SetNameImplCopyWithImpl(
      _$SetNameImpl _value, $Res Function(_$SetNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SetNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetNameImpl implements SetName {
  const _$SetNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'AddMedicineEvent.setName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetNameImplCopyWith<_$SetNameImpl> get copyWith =>
      __$$SetNameImplCopyWithImpl<_$SetNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return setName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return setName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return setName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return setName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(this);
    }
    return orElse();
  }
}

abstract class SetName implements AddMedicineEvent {
  const factory SetName(final String name) = _$SetNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$SetNameImplCopyWith<_$SetNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTypeImplCopyWith<$Res> {
  factory _$$SetTypeImplCopyWith(
          _$SetTypeImpl value, $Res Function(_$SetTypeImpl) then) =
      __$$SetTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineType type});
}

/// @nodoc
class __$$SetTypeImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SetTypeImpl>
    implements _$$SetTypeImplCopyWith<$Res> {
  __$$SetTypeImplCopyWithImpl(
      _$SetTypeImpl _value, $Res Function(_$SetTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SetTypeImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineType,
    ));
  }
}

/// @nodoc

class _$SetTypeImpl implements SetType {
  const _$SetTypeImpl(this.type);

  @override
  final MedicineType type;

  @override
  String toString() {
    return 'AddMedicineEvent.setType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTypeImplCopyWith<_$SetTypeImpl> get copyWith =>
      __$$SetTypeImplCopyWithImpl<_$SetTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return setType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return setType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setType != null) {
      return setType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return setType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return setType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (setType != null) {
      return setType(this);
    }
    return orElse();
  }
}

abstract class SetType implements AddMedicineEvent {
  const factory SetType(final MedicineType type) = _$SetTypeImpl;

  MedicineType get type;
  @JsonKey(ignore: true)
  _$$SetTypeImplCopyWith<_$SetTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPeriodicityImplCopyWith<$Res> {
  factory _$$SetPeriodicityImplCopyWith(_$SetPeriodicityImpl value,
          $Res Function(_$SetPeriodicityImpl) then) =
      __$$SetPeriodicityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Periodicity periodicity});
}

/// @nodoc
class __$$SetPeriodicityImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SetPeriodicityImpl>
    implements _$$SetPeriodicityImplCopyWith<$Res> {
  __$$SetPeriodicityImplCopyWithImpl(
      _$SetPeriodicityImpl _value, $Res Function(_$SetPeriodicityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodicity = null,
  }) {
    return _then(_$SetPeriodicityImpl(
      null == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as Periodicity,
    ));
  }
}

/// @nodoc

class _$SetPeriodicityImpl implements SetPeriodicity {
  const _$SetPeriodicityImpl(this.periodicity);

  @override
  final Periodicity periodicity;

  @override
  String toString() {
    return 'AddMedicineEvent.setPeriodicity(periodicity: $periodicity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPeriodicityImpl &&
            (identical(other.periodicity, periodicity) ||
                other.periodicity == periodicity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, periodicity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPeriodicityImplCopyWith<_$SetPeriodicityImpl> get copyWith =>
      __$$SetPeriodicityImplCopyWithImpl<_$SetPeriodicityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return setPeriodicity(periodicity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return setPeriodicity?.call(periodicity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setPeriodicity != null) {
      return setPeriodicity(periodicity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return setPeriodicity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return setPeriodicity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (setPeriodicity != null) {
      return setPeriodicity(this);
    }
    return orElse();
  }
}

abstract class SetPeriodicity implements AddMedicineEvent {
  const factory SetPeriodicity(final Periodicity periodicity) =
      _$SetPeriodicityImpl;

  Periodicity get periodicity;
  @JsonKey(ignore: true)
  _$$SetPeriodicityImplCopyWith<_$SetPeriodicityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetStartDateImplCopyWith<$Res> {
  factory _$$SetStartDateImplCopyWith(
          _$SetStartDateImpl value, $Res Function(_$SetStartDateImpl) then) =
      __$$SetStartDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startDate});
}

/// @nodoc
class __$$SetStartDateImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SetStartDateImpl>
    implements _$$SetStartDateImplCopyWith<$Res> {
  __$$SetStartDateImplCopyWithImpl(
      _$SetStartDateImpl _value, $Res Function(_$SetStartDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
  }) {
    return _then(_$SetStartDateImpl(
      null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SetStartDateImpl implements SetStartDate {
  const _$SetStartDateImpl(this.startDate);

  @override
  final DateTime startDate;

  @override
  String toString() {
    return 'AddMedicineEvent.setStartDate(startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetStartDateImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetStartDateImplCopyWith<_$SetStartDateImpl> get copyWith =>
      __$$SetStartDateImplCopyWithImpl<_$SetStartDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return setStartDate(startDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return setStartDate?.call(startDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setStartDate != null) {
      return setStartDate(startDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return setStartDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return setStartDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (setStartDate != null) {
      return setStartDate(this);
    }
    return orElse();
  }
}

abstract class SetStartDate implements AddMedicineEvent {
  const factory SetStartDate(final DateTime startDate) = _$SetStartDateImpl;

  DateTime get startDate;
  @JsonKey(ignore: true)
  _$$SetStartDateImplCopyWith<_$SetStartDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddWeekdayImplCopyWith<$Res> {
  factory _$$AddWeekdayImplCopyWith(
          _$AddWeekdayImpl value, $Res Function(_$AddWeekdayImpl) then) =
      __$$AddWeekdayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int weekday});
}

/// @nodoc
class __$$AddWeekdayImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$AddWeekdayImpl>
    implements _$$AddWeekdayImplCopyWith<$Res> {
  __$$AddWeekdayImplCopyWithImpl(
      _$AddWeekdayImpl _value, $Res Function(_$AddWeekdayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekday = null,
  }) {
    return _then(_$AddWeekdayImpl(
      null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddWeekdayImpl implements AddWeekday {
  const _$AddWeekdayImpl(this.weekday);

  @override
  final int weekday;

  @override
  String toString() {
    return 'AddMedicineEvent.addWeekday(weekday: $weekday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWeekdayImpl &&
            (identical(other.weekday, weekday) || other.weekday == weekday));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weekday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWeekdayImplCopyWith<_$AddWeekdayImpl> get copyWith =>
      __$$AddWeekdayImplCopyWithImpl<_$AddWeekdayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return addWeekday(weekday);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return addWeekday?.call(weekday);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (addWeekday != null) {
      return addWeekday(weekday);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return addWeekday(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return addWeekday?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (addWeekday != null) {
      return addWeekday(this);
    }
    return orElse();
  }
}

abstract class AddWeekday implements AddMedicineEvent {
  const factory AddWeekday(final int weekday) = _$AddWeekdayImpl;

  int get weekday;
  @JsonKey(ignore: true)
  _$$AddWeekdayImplCopyWith<_$AddWeekdayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveWeekdayImplCopyWith<$Res> {
  factory _$$RemoveWeekdayImplCopyWith(
          _$RemoveWeekdayImpl value, $Res Function(_$RemoveWeekdayImpl) then) =
      __$$RemoveWeekdayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int weekday});
}

/// @nodoc
class __$$RemoveWeekdayImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$RemoveWeekdayImpl>
    implements _$$RemoveWeekdayImplCopyWith<$Res> {
  __$$RemoveWeekdayImplCopyWithImpl(
      _$RemoveWeekdayImpl _value, $Res Function(_$RemoveWeekdayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekday = null,
  }) {
    return _then(_$RemoveWeekdayImpl(
      null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveWeekdayImpl implements RemoveWeekday {
  const _$RemoveWeekdayImpl(this.weekday);

  @override
  final int weekday;

  @override
  String toString() {
    return 'AddMedicineEvent.removeWeekday(weekday: $weekday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveWeekdayImpl &&
            (identical(other.weekday, weekday) || other.weekday == weekday));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weekday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveWeekdayImplCopyWith<_$RemoveWeekdayImpl> get copyWith =>
      __$$RemoveWeekdayImplCopyWithImpl<_$RemoveWeekdayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return removeWeekday(weekday);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return removeWeekday?.call(weekday);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (removeWeekday != null) {
      return removeWeekday(weekday);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return removeWeekday(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return removeWeekday?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (removeWeekday != null) {
      return removeWeekday(this);
    }
    return orElse();
  }
}

abstract class RemoveWeekday implements AddMedicineEvent {
  const factory RemoveWeekday(final int weekday) = _$RemoveWeekdayImpl;

  int get weekday;
  @JsonKey(ignore: true)
  _$$RemoveWeekdayImplCopyWith<_$RemoveWeekdayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddDoseImplCopyWith<$Res> {
  factory _$$AddDoseImplCopyWith(
          _$AddDoseImpl value, $Res Function(_$AddDoseImpl) then) =
      __$$AddDoseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimeOfDay time, int count});
}

/// @nodoc
class __$$AddDoseImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$AddDoseImpl>
    implements _$$AddDoseImplCopyWith<$Res> {
  __$$AddDoseImplCopyWithImpl(
      _$AddDoseImpl _value, $Res Function(_$AddDoseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? count = null,
  }) {
    return _then(_$AddDoseImpl(
      null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddDoseImpl implements AddDose {
  const _$AddDoseImpl(this.time, this.count);

  @override
  final TimeOfDay time;
  @override
  final int count;

  @override
  String toString() {
    return 'AddMedicineEvent.addDose(time: $time, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDoseImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDoseImplCopyWith<_$AddDoseImpl> get copyWith =>
      __$$AddDoseImplCopyWithImpl<_$AddDoseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return addDose(time, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return addDose?.call(time, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (addDose != null) {
      return addDose(time, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return addDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return addDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (addDose != null) {
      return addDose(this);
    }
    return orElse();
  }
}

abstract class AddDose implements AddMedicineEvent {
  const factory AddDose(final TimeOfDay time, final int count) = _$AddDoseImpl;

  TimeOfDay get time;
  int get count;
  @JsonKey(ignore: true)
  _$$AddDoseImplCopyWith<_$AddDoseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDoseImplCopyWith<$Res> {
  factory _$$ChangeDoseImplCopyWith(
          _$ChangeDoseImpl value, $Res Function(_$ChangeDoseImpl) then) =
      __$$ChangeDoseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, TimeOfDay? time, int? count});
}

/// @nodoc
class __$$ChangeDoseImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$ChangeDoseImpl>
    implements _$$ChangeDoseImplCopyWith<$Res> {
  __$$ChangeDoseImplCopyWithImpl(
      _$ChangeDoseImpl _value, $Res Function(_$ChangeDoseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? time = freezed,
    Object? count = freezed,
  }) {
    return _then(_$ChangeDoseImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeDoseImpl implements ChangeDose {
  const _$ChangeDoseImpl({required this.index, this.time, this.count});

  @override
  final int index;
  @override
  final TimeOfDay? time;
  @override
  final int? count;

  @override
  String toString() {
    return 'AddMedicineEvent.changeDose(index: $index, time: $time, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDoseImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, time, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDoseImplCopyWith<_$ChangeDoseImpl> get copyWith =>
      __$$ChangeDoseImplCopyWithImpl<_$ChangeDoseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return changeDose(index, time, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return changeDose?.call(index, time, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (changeDose != null) {
      return changeDose(index, time, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return changeDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return changeDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (changeDose != null) {
      return changeDose(this);
    }
    return orElse();
  }
}

abstract class ChangeDose implements AddMedicineEvent {
  const factory ChangeDose(
      {required final int index,
      final TimeOfDay? time,
      final int? count}) = _$ChangeDoseImpl;

  int get index;
  TimeOfDay? get time;
  int? get count;
  @JsonKey(ignore: true)
  _$$ChangeDoseImplCopyWith<_$ChangeDoseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddInstructionImplCopyWith<$Res> {
  factory _$$AddInstructionImplCopyWith(_$AddInstructionImpl value,
          $Res Function(_$AddInstructionImpl) then) =
      __$$AddInstructionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Instruction instruction});
}

/// @nodoc
class __$$AddInstructionImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$AddInstructionImpl>
    implements _$$AddInstructionImplCopyWith<$Res> {
  __$$AddInstructionImplCopyWithImpl(
      _$AddInstructionImpl _value, $Res Function(_$AddInstructionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
  }) {
    return _then(_$AddInstructionImpl(
      null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as Instruction,
    ));
  }
}

/// @nodoc

class _$AddInstructionImpl implements AddInstruction {
  const _$AddInstructionImpl(this.instruction);

  @override
  final Instruction instruction;

  @override
  String toString() {
    return 'AddMedicineEvent.addInstruction(instruction: $instruction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddInstructionImpl &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instruction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddInstructionImplCopyWith<_$AddInstructionImpl> get copyWith =>
      __$$AddInstructionImplCopyWithImpl<_$AddInstructionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return addInstruction(instruction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return addInstruction?.call(instruction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (addInstruction != null) {
      return addInstruction(instruction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return addInstruction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return addInstruction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (addInstruction != null) {
      return addInstruction(this);
    }
    return orElse();
  }
}

abstract class AddInstruction implements AddMedicineEvent {
  const factory AddInstruction(final Instruction instruction) =
      _$AddInstructionImpl;

  Instruction get instruction;
  @JsonKey(ignore: true)
  _$$AddInstructionImplCopyWith<_$AddInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveMedicineImplCopyWith<$Res> {
  factory _$$SaveMedicineImplCopyWith(
          _$SaveMedicineImpl value, $Res Function(_$SaveMedicineImpl) then) =
      __$$SaveMedicineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveMedicineImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SaveMedicineImpl>
    implements _$$SaveMedicineImplCopyWith<$Res> {
  __$$SaveMedicineImplCopyWithImpl(
      _$SaveMedicineImpl _value, $Res Function(_$SaveMedicineImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveMedicineImpl implements SaveMedicine {
  const _$SaveMedicineImpl();

  @override
  String toString() {
    return 'AddMedicineEvent.save()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveMedicineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(MedicineType type) setType,
    required TResult Function(Periodicity periodicity) setPeriodicity,
    required TResult Function(DateTime startDate) setStartDate,
    required TResult Function(int weekday) addWeekday,
    required TResult Function(int weekday) removeWeekday,
    required TResult Function(TimeOfDay time, int count) addDose,
    required TResult Function(int index, TimeOfDay? time, int? count)
        changeDose,
    required TResult Function(Instruction instruction) addInstruction,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(MedicineType type)? setType,
    TResult? Function(Periodicity periodicity)? setPeriodicity,
    TResult? Function(DateTime startDate)? setStartDate,
    TResult? Function(int weekday)? addWeekday,
    TResult? Function(int weekday)? removeWeekday,
    TResult? Function(TimeOfDay time, int count)? addDose,
    TResult? Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult? Function(Instruction instruction)? addInstruction,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(MedicineType type)? setType,
    TResult Function(Periodicity periodicity)? setPeriodicity,
    TResult Function(DateTime startDate)? setStartDate,
    TResult Function(int weekday)? addWeekday,
    TResult Function(int weekday)? removeWeekday,
    TResult Function(TimeOfDay time, int count)? addDose,
    TResult Function(int index, TimeOfDay? time, int? count)? changeDose,
    TResult Function(Instruction instruction)? addInstruction,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetType value) setType,
    required TResult Function(SetPeriodicity value) setPeriodicity,
    required TResult Function(SetStartDate value) setStartDate,
    required TResult Function(AddWeekday value) addWeekday,
    required TResult Function(RemoveWeekday value) removeWeekday,
    required TResult Function(AddDose value) addDose,
    required TResult Function(ChangeDose value) changeDose,
    required TResult Function(AddInstruction value) addInstruction,
    required TResult Function(SaveMedicine value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetPeriodicity value)? setPeriodicity,
    TResult? Function(SetStartDate value)? setStartDate,
    TResult? Function(AddWeekday value)? addWeekday,
    TResult? Function(RemoveWeekday value)? removeWeekday,
    TResult? Function(AddDose value)? addDose,
    TResult? Function(ChangeDose value)? changeDose,
    TResult? Function(AddInstruction value)? addInstruction,
    TResult? Function(SaveMedicine value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetType value)? setType,
    TResult Function(SetPeriodicity value)? setPeriodicity,
    TResult Function(SetStartDate value)? setStartDate,
    TResult Function(AddWeekday value)? addWeekday,
    TResult Function(RemoveWeekday value)? removeWeekday,
    TResult Function(AddDose value)? addDose,
    TResult Function(ChangeDose value)? changeDose,
    TResult Function(AddInstruction value)? addInstruction,
    TResult Function(SaveMedicine value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveMedicine implements AddMedicineEvent {
  const factory SaveMedicine() = _$SaveMedicineImpl;
}

/// @nodoc
mixin _$AddMedicineState {
  String get name => throw _privateConstructorUsedError;
  MedicineType? get type => throw _privateConstructorUsedError;
  Periodicity? get periodicity =>
      throw _privateConstructorUsedError; // DayPeriodicity? dayPeriodicity,
  DateTime? get startDate => throw _privateConstructorUsedError;
  Set<int> get weekdays => throw _privateConstructorUsedError;
  Map<TimeOfDay, int> get doses => throw _privateConstructorUsedError;
  Instruction? get instruction => throw _privateConstructorUsedError;
  MedicineModel? get medicine => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMedicineStateCopyWith<AddMedicineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMedicineStateCopyWith<$Res> {
  factory $AddMedicineStateCopyWith(
          AddMedicineState value, $Res Function(AddMedicineState) then) =
      _$AddMedicineStateCopyWithImpl<$Res, AddMedicineState>;
  @useResult
  $Res call(
      {String name,
      MedicineType? type,
      Periodicity? periodicity,
      DateTime? startDate,
      Set<int> weekdays,
      Map<TimeOfDay, int> doses,
      Instruction? instruction,
      MedicineModel? medicine});

  $MedicineModelCopyWith<$Res>? get medicine;
}

/// @nodoc
class _$AddMedicineStateCopyWithImpl<$Res, $Val extends AddMedicineState>
    implements $AddMedicineStateCopyWith<$Res> {
  _$AddMedicineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = freezed,
    Object? periodicity = freezed,
    Object? startDate = freezed,
    Object? weekdays = null,
    Object? doses = null,
    Object? instruction = freezed,
    Object? medicine = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineType?,
      periodicity: freezed == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as Periodicity?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      doses: null == doses
          ? _value.doses
          : doses // ignore: cast_nullable_to_non_nullable
              as Map<TimeOfDay, int>,
      instruction: freezed == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as Instruction?,
      medicine: freezed == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res>? get medicine {
    if (_value.medicine == null) {
      return null;
    }

    return $MedicineModelCopyWith<$Res>(_value.medicine!, (value) {
      return _then(_value.copyWith(medicine: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StateImplCopyWith<$Res>
    implements $AddMedicineStateCopyWith<$Res> {
  factory _$$StateImplCopyWith(
          _$StateImpl value, $Res Function(_$StateImpl) then) =
      __$$StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MedicineType? type,
      Periodicity? periodicity,
      DateTime? startDate,
      Set<int> weekdays,
      Map<TimeOfDay, int> doses,
      Instruction? instruction,
      MedicineModel? medicine});

  @override
  $MedicineModelCopyWith<$Res>? get medicine;
}

/// @nodoc
class __$$StateImplCopyWithImpl<$Res>
    extends _$AddMedicineStateCopyWithImpl<$Res, _$StateImpl>
    implements _$$StateImplCopyWith<$Res> {
  __$$StateImplCopyWithImpl(
      _$StateImpl _value, $Res Function(_$StateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = freezed,
    Object? periodicity = freezed,
    Object? startDate = freezed,
    Object? weekdays = null,
    Object? doses = null,
    Object? instruction = freezed,
    Object? medicine = freezed,
  }) {
    return _then(_$StateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineType?,
      periodicity: freezed == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as Periodicity?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekdays: null == weekdays
          ? _value._weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      doses: null == doses
          ? _value._doses
          : doses // ignore: cast_nullable_to_non_nullable
              as Map<TimeOfDay, int>,
      instruction: freezed == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as Instruction?,
      medicine: freezed == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel?,
    ));
  }
}

/// @nodoc

class _$StateImpl extends _State {
  const _$StateImpl(
      {this.name = '',
      this.type,
      this.periodicity,
      this.startDate,
      final Set<int> weekdays = const {},
      final Map<TimeOfDay, int> doses = const {},
      this.instruction,
      this.medicine})
      : _weekdays = weekdays,
        _doses = doses,
        super._();

  @override
  @JsonKey()
  final String name;
  @override
  final MedicineType? type;
  @override
  final Periodicity? periodicity;
// DayPeriodicity? dayPeriodicity,
  @override
  final DateTime? startDate;
  final Set<int> _weekdays;
  @override
  @JsonKey()
  Set<int> get weekdays {
    if (_weekdays is EqualUnmodifiableSetView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_weekdays);
  }

  final Map<TimeOfDay, int> _doses;
  @override
  @JsonKey()
  Map<TimeOfDay, int> get doses {
    if (_doses is EqualUnmodifiableMapView) return _doses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_doses);
  }

  @override
  final Instruction? instruction;
  @override
  final MedicineModel? medicine;

  @override
  String toString() {
    return 'AddMedicineState(name: $name, type: $type, periodicity: $periodicity, startDate: $startDate, weekdays: $weekdays, doses: $doses, instruction: $instruction, medicine: $medicine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.periodicity, periodicity) ||
                other.periodicity == periodicity) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays) &&
            const DeepCollectionEquality().equals(other._doses, _doses) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      type,
      periodicity,
      startDate,
      const DeepCollectionEquality().hash(_weekdays),
      const DeepCollectionEquality().hash(_doses),
      instruction,
      medicine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);
}

abstract class _State extends AddMedicineState {
  const factory _State(
      {final String name,
      final MedicineType? type,
      final Periodicity? periodicity,
      final DateTime? startDate,
      final Set<int> weekdays,
      final Map<TimeOfDay, int> doses,
      final Instruction? instruction,
      final MedicineModel? medicine}) = _$StateImpl;
  const _State._() : super._();

  @override
  String get name;
  @override
  MedicineType? get type;
  @override
  Periodicity? get periodicity;
  @override // DayPeriodicity? dayPeriodicity,
  DateTime? get startDate;
  @override
  Set<int> get weekdays;
  @override
  Map<TimeOfDay, int> get doses;
  @override
  Instruction? get instruction;
  @override
  MedicineModel? get medicine;
  @override
  @JsonKey(ignore: true)
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
