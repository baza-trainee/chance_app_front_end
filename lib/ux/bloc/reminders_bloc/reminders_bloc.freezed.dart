// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemindersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersEventCopyWith<$Res> {
  factory $RemindersEventCopyWith(
          RemindersEvent value, $Res Function(RemindersEvent) then) =
      _$RemindersEventCopyWithImpl<$Res, RemindersEvent>;
}

/// @nodoc
class _$RemindersEventCopyWithImpl<$Res, $Val extends RemindersEvent>
    implements $RemindersEventCopyWith<$Res> {
  _$RemindersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadDataImplCopyWith<$Res> {
  factory _$$LoadDataImplCopyWith(
          _$LoadDataImpl value, $Res Function(_$LoadDataImpl) then) =
      __$$LoadDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDataImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$LoadDataImpl>
    implements _$$LoadDataImplCopyWith<$Res> {
  __$$LoadDataImplCopyWithImpl(
      _$LoadDataImpl _value, $Res Function(_$LoadDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadDataImpl implements LoadData {
  const _$LoadDataImpl();

  @override
  String toString() {
    return 'RemindersEvent.loadData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class LoadData implements RemindersEvent {
  const factory LoadData() = _$LoadDataImpl;
}

/// @nodoc
abstract class _$$SelectDayImplCopyWith<$Res> {
  factory _$$SelectDayImplCopyWith(
          _$SelectDayImpl value, $Res Function(_$SelectDayImpl) then) =
      __$$SelectDayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dayDate});
}

/// @nodoc
class __$$SelectDayImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$SelectDayImpl>
    implements _$$SelectDayImplCopyWith<$Res> {
  __$$SelectDayImplCopyWithImpl(
      _$SelectDayImpl _value, $Res Function(_$SelectDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayDate = null,
  }) {
    return _then(_$SelectDayImpl(
      null == dayDate
          ? _value.dayDate
          : dayDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SelectDayImpl implements SelectDay {
  const _$SelectDayImpl(this.dayDate);

  @override
  final DateTime dayDate;

  @override
  String toString() {
    return 'RemindersEvent.selectDay(dayDate: $dayDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDayImpl &&
            (identical(other.dayDate, dayDate) || other.dayDate == dayDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDayImplCopyWith<_$SelectDayImpl> get copyWith =>
      __$$SelectDayImplCopyWithImpl<_$SelectDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return selectDay(dayDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return selectDay?.call(dayDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (selectDay != null) {
      return selectDay(dayDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return selectDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return selectDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (selectDay != null) {
      return selectDay(this);
    }
    return orElse();
  }
}

abstract class SelectDay implements RemindersEvent {
  const factory SelectDay(final DateTime dayDate) = _$SelectDayImpl;

  DateTime get dayDate;
  @JsonKey(ignore: true)
  _$$SelectDayImplCopyWith<_$SelectDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTaskImplCopyWith<$Res> {
  factory _$$AddTaskImplCopyWith(
          _$AddTaskImpl value, $Res Function(_$AddTaskImpl) then) =
      __$$AddTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$AddTaskImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$AddTaskImpl>
    implements _$$AddTaskImplCopyWith<$Res> {
  __$$AddTaskImplCopyWithImpl(
      _$AddTaskImpl _value, $Res Function(_$AddTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$AddTaskImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$AddTaskImpl implements AddTask {
  const _$AddTaskImpl(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'RemindersEvent.addTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      __$$AddTaskImplCopyWithImpl<_$AddTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return addTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return addTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class AddTask implements RemindersEvent {
  const factory AddTask(final TaskModel task) = _$AddTaskImpl;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskIsDoneImplCopyWith<$Res> {
  factory _$$TaskIsDoneImplCopyWith(
          _$TaskIsDoneImpl value, $Res Function(_$TaskIsDoneImpl) then) =
      __$$TaskIsDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskIsDoneImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$TaskIsDoneImpl>
    implements _$$TaskIsDoneImplCopyWith<$Res> {
  __$$TaskIsDoneImplCopyWithImpl(
      _$TaskIsDoneImpl _value, $Res Function(_$TaskIsDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$TaskIsDoneImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskIsDoneImpl implements TaskIsDone {
  const _$TaskIsDoneImpl(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'RemindersEvent.taskIsDone(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskIsDoneImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskIsDoneImplCopyWith<_$TaskIsDoneImpl> get copyWith =>
      __$$TaskIsDoneImplCopyWithImpl<_$TaskIsDoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return taskIsDone(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return taskIsDone?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (taskIsDone != null) {
      return taskIsDone(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return taskIsDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return taskIsDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (taskIsDone != null) {
      return taskIsDone(this);
    }
    return orElse();
  }
}

abstract class TaskIsDone implements RemindersEvent {
  const factory TaskIsDone(final TaskModel task) = _$TaskIsDoneImpl;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$TaskIsDoneImplCopyWith<_$TaskIsDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskIsPostponedImplCopyWith<$Res> {
  factory _$$TaskIsPostponedImplCopyWith(_$TaskIsPostponedImpl value,
          $Res Function(_$TaskIsPostponedImpl) then) =
      __$$TaskIsPostponedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task, int minutes});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskIsPostponedImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$TaskIsPostponedImpl>
    implements _$$TaskIsPostponedImplCopyWith<$Res> {
  __$$TaskIsPostponedImplCopyWithImpl(
      _$TaskIsPostponedImpl _value, $Res Function(_$TaskIsPostponedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? minutes = null,
  }) {
    return _then(_$TaskIsPostponedImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskIsPostponedImpl implements TaskIsPostponed {
  const _$TaskIsPostponedImpl(this.task, {required this.minutes});

  @override
  final TaskModel task;
  @override
  final int minutes;

  @override
  String toString() {
    return 'RemindersEvent.taskIsPostponed(task: $task, minutes: $minutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskIsPostponedImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, minutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskIsPostponedImplCopyWith<_$TaskIsPostponedImpl> get copyWith =>
      __$$TaskIsPostponedImplCopyWithImpl<_$TaskIsPostponedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return taskIsPostponed(task, minutes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return taskIsPostponed?.call(task, minutes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (taskIsPostponed != null) {
      return taskIsPostponed(task, minutes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return taskIsPostponed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return taskIsPostponed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (taskIsPostponed != null) {
      return taskIsPostponed(this);
    }
    return orElse();
  }
}

abstract class TaskIsPostponed implements RemindersEvent {
  const factory TaskIsPostponed(final TaskModel task,
      {required final int minutes}) = _$TaskIsPostponedImpl;

  TaskModel get task;
  int get minutes;
  @JsonKey(ignore: true)
  _$$TaskIsPostponedImplCopyWith<_$TaskIsPostponedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTaskImplCopyWith<$Res> {
  factory _$$DeleteTaskImplCopyWith(
          _$DeleteTaskImpl value, $Res Function(_$DeleteTaskImpl) then) =
      __$$DeleteTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$DeleteTaskImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$DeleteTaskImpl>
    implements _$$DeleteTaskImplCopyWith<$Res> {
  __$$DeleteTaskImplCopyWithImpl(
      _$DeleteTaskImpl _value, $Res Function(_$DeleteTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$DeleteTaskImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$DeleteTaskImpl implements DeleteTask {
  const _$DeleteTaskImpl(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'RemindersEvent.deleteTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTaskImplCopyWith<_$DeleteTaskImpl> get copyWith =>
      __$$DeleteTaskImplCopyWithImpl<_$DeleteTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return deleteTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return deleteTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class DeleteTask implements RemindersEvent {
  const factory DeleteTask(final TaskModel task) = _$DeleteTaskImpl;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$DeleteTaskImplCopyWith<_$DeleteTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddMedicineImplCopyWith<$Res> {
  factory _$$AddMedicineImplCopyWith(
          _$AddMedicineImpl value, $Res Function(_$AddMedicineImpl) then) =
      __$$AddMedicineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineModel medicine});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$AddMedicineImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$AddMedicineImpl>
    implements _$$AddMedicineImplCopyWith<$Res> {
  __$$AddMedicineImplCopyWithImpl(
      _$AddMedicineImpl _value, $Res Function(_$AddMedicineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
  }) {
    return _then(_$AddMedicineImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$AddMedicineImpl implements AddMedicine {
  const _$AddMedicineImpl(this.medicine);

  @override
  final MedicineModel medicine;

  @override
  String toString() {
    return 'RemindersEvent.addMedicine(medicine: $medicine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMedicineImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMedicineImplCopyWith<_$AddMedicineImpl> get copyWith =>
      __$$AddMedicineImplCopyWithImpl<_$AddMedicineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return addMedicine(medicine);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return addMedicine?.call(medicine);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (addMedicine != null) {
      return addMedicine(medicine);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return addMedicine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return addMedicine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (addMedicine != null) {
      return addMedicine(this);
    }
    return orElse();
  }
}

abstract class AddMedicine implements RemindersEvent {
  const factory AddMedicine(final MedicineModel medicine) = _$AddMedicineImpl;

  MedicineModel get medicine;
  @JsonKey(ignore: true)
  _$$AddMedicineImplCopyWith<_$AddMedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineIsDoneImplCopyWith<$Res> {
  factory _$$MedicineIsDoneImplCopyWith(_$MedicineIsDoneImpl value,
          $Res Function(_$MedicineIsDoneImpl) then) =
      __$$MedicineIsDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineModel medicine, DateTime at});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicineIsDoneImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$MedicineIsDoneImpl>
    implements _$$MedicineIsDoneImplCopyWith<$Res> {
  __$$MedicineIsDoneImplCopyWithImpl(
      _$MedicineIsDoneImpl _value, $Res Function(_$MedicineIsDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? at = null,
  }) {
    return _then(_$MedicineIsDoneImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicineIsDoneImpl implements MedicineIsDone {
  const _$MedicineIsDoneImpl(this.medicine, {required this.at});

  @override
  final MedicineModel medicine;
  @override
  final DateTime at;

  @override
  String toString() {
    return 'RemindersEvent.medicineIsDone(medicine: $medicine, at: $at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineIsDoneImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.at, at) || other.at == at));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicine, at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineIsDoneImplCopyWith<_$MedicineIsDoneImpl> get copyWith =>
      __$$MedicineIsDoneImplCopyWithImpl<_$MedicineIsDoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return medicineIsDone(medicine, at);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return medicineIsDone?.call(medicine, at);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (medicineIsDone != null) {
      return medicineIsDone(medicine, at);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return medicineIsDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return medicineIsDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (medicineIsDone != null) {
      return medicineIsDone(this);
    }
    return orElse();
  }
}

abstract class MedicineIsDone implements RemindersEvent {
  const factory MedicineIsDone(final MedicineModel medicine,
      {required final DateTime at}) = _$MedicineIsDoneImpl;

  MedicineModel get medicine;
  DateTime get at;
  @JsonKey(ignore: true)
  _$$MedicineIsDoneImplCopyWith<_$MedicineIsDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineIsPostponedImplCopyWith<$Res> {
  factory _$$MedicineIsPostponedImplCopyWith(_$MedicineIsPostponedImpl value,
          $Res Function(_$MedicineIsPostponedImpl) then) =
      __$$MedicineIsPostponedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineModel medicine, DateTime doseTime, int minutes});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicineIsPostponedImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$MedicineIsPostponedImpl>
    implements _$$MedicineIsPostponedImplCopyWith<$Res> {
  __$$MedicineIsPostponedImplCopyWithImpl(_$MedicineIsPostponedImpl _value,
      $Res Function(_$MedicineIsPostponedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? doseTime = null,
    Object? minutes = null,
  }) {
    return _then(_$MedicineIsPostponedImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      doseTime: null == doseTime
          ? _value.doseTime
          : doseTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicineIsPostponedImpl implements MedicineIsPostponed {
  const _$MedicineIsPostponedImpl(this.medicine,
      {required this.doseTime, required this.minutes});

  @override
  final MedicineModel medicine;
  @override
  final DateTime doseTime;
  @override
  final int minutes;

  @override
  String toString() {
    return 'RemindersEvent.medicineIsPostponed(medicine: $medicine, doseTime: $doseTime, minutes: $minutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineIsPostponedImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.doseTime, doseTime) ||
                other.doseTime == doseTime) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicine, doseTime, minutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineIsPostponedImplCopyWith<_$MedicineIsPostponedImpl> get copyWith =>
      __$$MedicineIsPostponedImplCopyWithImpl<_$MedicineIsPostponedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return medicineIsPostponed(medicine, doseTime, minutes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return medicineIsPostponed?.call(medicine, doseTime, minutes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (medicineIsPostponed != null) {
      return medicineIsPostponed(medicine, doseTime, minutes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return medicineIsPostponed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return medicineIsPostponed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (medicineIsPostponed != null) {
      return medicineIsPostponed(this);
    }
    return orElse();
  }
}

abstract class MedicineIsPostponed implements RemindersEvent {
  const factory MedicineIsPostponed(final MedicineModel medicine,
      {required final DateTime doseTime,
      required final int minutes}) = _$MedicineIsPostponedImpl;

  MedicineModel get medicine;
  DateTime get doseTime;
  int get minutes;
  @JsonKey(ignore: true)
  _$$MedicineIsPostponedImplCopyWith<_$MedicineIsPostponedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMedicineImplCopyWith<$Res> {
  factory _$$DeleteMedicineImplCopyWith(_$DeleteMedicineImpl value,
          $Res Function(_$DeleteMedicineImpl) then) =
      __$$DeleteMedicineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineModel medicine});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$DeleteMedicineImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$DeleteMedicineImpl>
    implements _$$DeleteMedicineImplCopyWith<$Res> {
  __$$DeleteMedicineImplCopyWithImpl(
      _$DeleteMedicineImpl _value, $Res Function(_$DeleteMedicineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
  }) {
    return _then(_$DeleteMedicineImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$DeleteMedicineImpl implements DeleteMedicine {
  const _$DeleteMedicineImpl(this.medicine);

  @override
  final MedicineModel medicine;

  @override
  String toString() {
    return 'RemindersEvent.deleteMedicine(medicine: $medicine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMedicineImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMedicineImplCopyWith<_$DeleteMedicineImpl> get copyWith =>
      __$$DeleteMedicineImplCopyWithImpl<_$DeleteMedicineImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return deleteMedicine(medicine);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return deleteMedicine?.call(medicine);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (deleteMedicine != null) {
      return deleteMedicine(medicine);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return deleteMedicine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return deleteMedicine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (deleteMedicine != null) {
      return deleteMedicine(this);
    }
    return orElse();
  }
}

abstract class DeleteMedicine implements RemindersEvent {
  const factory DeleteMedicine(final MedicineModel medicine) =
      _$DeleteMedicineImpl;

  MedicineModel get medicine;
  @JsonKey(ignore: true)
  _$$DeleteMedicineImplCopyWith<_$DeleteMedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelAllRemindersImplCopyWith<$Res> {
  factory _$$CancelAllRemindersImplCopyWith(_$CancelAllRemindersImpl value,
          $Res Function(_$CancelAllRemindersImpl) then) =
      __$$CancelAllRemindersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelAllRemindersImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$CancelAllRemindersImpl>
    implements _$$CancelAllRemindersImplCopyWith<$Res> {
  __$$CancelAllRemindersImplCopyWithImpl(_$CancelAllRemindersImpl _value,
      $Res Function(_$CancelAllRemindersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelAllRemindersImpl implements CancelAllReminders {
  const _$CancelAllRemindersImpl();

  @override
  String toString() {
    return 'RemindersEvent.cancelAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelAllRemindersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(DateTime dayDate) selectDay,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) taskIsDone,
    required TResult Function(TaskModel task, int minutes) taskIsPostponed,
    required TResult Function(TaskModel task) deleteTask,
    required TResult Function(MedicineModel medicine) addMedicine,
    required TResult Function(MedicineModel medicine, DateTime at)
        medicineIsDone,
    required TResult Function(
            MedicineModel medicine, DateTime doseTime, int minutes)
        medicineIsPostponed,
    required TResult Function(MedicineModel medicine) deleteMedicine,
    required TResult Function() cancelAll,
  }) {
    return cancelAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(DateTime dayDate)? selectDay,
    TResult? Function(TaskModel task)? addTask,
    TResult? Function(TaskModel task)? taskIsDone,
    TResult? Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult? Function(TaskModel task)? deleteTask,
    TResult? Function(MedicineModel medicine)? addMedicine,
    TResult? Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult? Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult? Function(MedicineModel medicine)? deleteMedicine,
    TResult? Function()? cancelAll,
  }) {
    return cancelAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(DateTime dayDate)? selectDay,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? taskIsDone,
    TResult Function(TaskModel task, int minutes)? taskIsPostponed,
    TResult Function(TaskModel task)? deleteTask,
    TResult Function(MedicineModel medicine)? addMedicine,
    TResult Function(MedicineModel medicine, DateTime at)? medicineIsDone,
    TResult Function(MedicineModel medicine, DateTime doseTime, int minutes)?
        medicineIsPostponed,
    TResult Function(MedicineModel medicine)? deleteMedicine,
    TResult Function()? cancelAll,
    required TResult orElse(),
  }) {
    if (cancelAll != null) {
      return cancelAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(SelectDay value) selectDay,
    required TResult Function(AddTask value) addTask,
    required TResult Function(TaskIsDone value) taskIsDone,
    required TResult Function(TaskIsPostponed value) taskIsPostponed,
    required TResult Function(DeleteTask value) deleteTask,
    required TResult Function(AddMedicine value) addMedicine,
    required TResult Function(MedicineIsDone value) medicineIsDone,
    required TResult Function(MedicineIsPostponed value) medicineIsPostponed,
    required TResult Function(DeleteMedicine value) deleteMedicine,
    required TResult Function(CancelAllReminders value) cancelAll,
  }) {
    return cancelAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(SelectDay value)? selectDay,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(TaskIsDone value)? taskIsDone,
    TResult? Function(TaskIsPostponed value)? taskIsPostponed,
    TResult? Function(DeleteTask value)? deleteTask,
    TResult? Function(AddMedicine value)? addMedicine,
    TResult? Function(MedicineIsDone value)? medicineIsDone,
    TResult? Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult? Function(DeleteMedicine value)? deleteMedicine,
    TResult? Function(CancelAllReminders value)? cancelAll,
  }) {
    return cancelAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(SelectDay value)? selectDay,
    TResult Function(AddTask value)? addTask,
    TResult Function(TaskIsDone value)? taskIsDone,
    TResult Function(TaskIsPostponed value)? taskIsPostponed,
    TResult Function(DeleteTask value)? deleteTask,
    TResult Function(AddMedicine value)? addMedicine,
    TResult Function(MedicineIsDone value)? medicineIsDone,
    TResult Function(MedicineIsPostponed value)? medicineIsPostponed,
    TResult Function(DeleteMedicine value)? deleteMedicine,
    TResult Function(CancelAllReminders value)? cancelAll,
    required TResult orElse(),
  }) {
    if (cancelAll != null) {
      return cancelAll(this);
    }
    return orElse();
  }
}

abstract class CancelAllReminders implements RemindersEvent {
  const factory CancelAllReminders() = _$CancelAllRemindersImpl;
}

/// @nodoc
mixin _$RemindersState {
  DateTime get selectedDay => throw _privateConstructorUsedError;
  List<TaskModel> get tasks => throw _privateConstructorUsedError;
  List<MedicineModel> get medicines => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemindersStateCopyWith<RemindersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersStateCopyWith<$Res> {
  factory $RemindersStateCopyWith(
          RemindersState value, $Res Function(RemindersState) then) =
      _$RemindersStateCopyWithImpl<$Res, RemindersState>;
  @useResult
  $Res call(
      {DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});
}

/// @nodoc
class _$RemindersStateCopyWithImpl<$Res, $Val extends RemindersState>
    implements $RemindersStateCopyWith<$Res> {
  _$RemindersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_value.copyWith(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value.medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$InitialImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.selectedDay,
      final List<TaskModel> tasks = const [],
      final List<MedicineModel> medicines = const []})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  @JsonKey()
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  @JsonKey()
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.initial(selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return initial(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return initial?.call(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RemindersState {
  const factory _Initial(
      {required final DateTime selectedDay,
      final List<TaskModel> tasks,
      final List<MedicineModel> medicines}) = _$InitialImpl;

  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemindersLoadingImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$RemindersLoadingImplCopyWith(_$RemindersLoadingImpl value,
          $Res Function(_$RemindersLoadingImpl) then) =
      __$$RemindersLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});
}

/// @nodoc
class __$$RemindersLoadingImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersLoadingImpl>
    implements _$$RemindersLoadingImplCopyWith<$Res> {
  __$$RemindersLoadingImplCopyWithImpl(_$RemindersLoadingImpl _value,
      $Res Function(_$RemindersLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$RemindersLoadingImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }
}

/// @nodoc

class _$RemindersLoadingImpl implements RemindersLoading {
  const _$RemindersLoadingImpl(
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.loading(selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersLoadingImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersLoadingImplCopyWith<_$RemindersLoadingImpl> get copyWith =>
      __$$RemindersLoadingImplCopyWithImpl<_$RemindersLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return loading(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return loading?.call(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RemindersLoading implements RemindersState {
  const factory RemindersLoading(
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$RemindersLoadingImpl;

  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$RemindersLoadingImplCopyWith<_$RemindersLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemindersRefreshedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$RemindersRefreshedImplCopyWith(_$RemindersRefreshedImpl value,
          $Res Function(_$RemindersRefreshedImpl) then) =
      __$$RemindersRefreshedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});
}

/// @nodoc
class __$$RemindersRefreshedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersRefreshedImpl>
    implements _$$RemindersRefreshedImplCopyWith<$Res> {
  __$$RemindersRefreshedImplCopyWithImpl(_$RemindersRefreshedImpl _value,
      $Res Function(_$RemindersRefreshedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$RemindersRefreshedImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }
}

/// @nodoc

class _$RemindersRefreshedImpl implements RemindersRefreshed {
  const _$RemindersRefreshedImpl(
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.remindersRefreshed(selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersRefreshedImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersRefreshedImplCopyWith<_$RemindersRefreshedImpl> get copyWith =>
      __$$RemindersRefreshedImplCopyWithImpl<_$RemindersRefreshedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return remindersRefreshed(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return remindersRefreshed?.call(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (remindersRefreshed != null) {
      return remindersRefreshed(selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return remindersRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return remindersRefreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (remindersRefreshed != null) {
      return remindersRefreshed(this);
    }
    return orElse();
  }
}

abstract class RemindersRefreshed implements RemindersState {
  const factory RemindersRefreshed(
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$RemindersRefreshedImpl;

  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$RemindersRefreshedImplCopyWith<_$RemindersRefreshedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaySelectedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$DaySelectedImplCopyWith(
          _$DaySelectedImpl value, $Res Function(_$DaySelectedImpl) then) =
      __$$DaySelectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});
}

/// @nodoc
class __$$DaySelectedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$DaySelectedImpl>
    implements _$$DaySelectedImplCopyWith<$Res> {
  __$$DaySelectedImplCopyWithImpl(
      _$DaySelectedImpl _value, $Res Function(_$DaySelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$DaySelectedImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }
}

/// @nodoc

class _$DaySelectedImpl implements DaySelected {
  const _$DaySelectedImpl(
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.daySelected(selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaySelectedImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaySelectedImplCopyWith<_$DaySelectedImpl> get copyWith =>
      __$$DaySelectedImplCopyWithImpl<_$DaySelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return daySelected(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return daySelected?.call(selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (daySelected != null) {
      return daySelected(selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return daySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return daySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (daySelected != null) {
      return daySelected(this);
    }
    return orElse();
  }
}

abstract class DaySelected implements RemindersState {
  const factory DaySelected(
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$DaySelectedImpl;

  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$DaySelectedImplCopyWith<_$DaySelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskAddedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$TaskAddedImplCopyWith(
          _$TaskAddedImpl value, $Res Function(_$TaskAddedImpl) then) =
      __$$TaskAddedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskModel task,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskAddedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$TaskAddedImpl>
    implements _$$TaskAddedImplCopyWith<$Res> {
  __$$TaskAddedImplCopyWithImpl(
      _$TaskAddedImpl _value, $Res Function(_$TaskAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$TaskAddedImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskAddedImpl implements TaskAdded {
  const _$TaskAddedImpl(this.task,
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final TaskModel task;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.taskAdded(task: $task, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskAddedImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      task,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskAddedImplCopyWith<_$TaskAddedImpl> get copyWith =>
      __$$TaskAddedImplCopyWithImpl<_$TaskAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return taskAdded(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return taskAdded?.call(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskAdded != null) {
      return taskAdded(task, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return taskAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return taskAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskAdded != null) {
      return taskAdded(this);
    }
    return orElse();
  }
}

abstract class TaskAdded implements RemindersState {
  const factory TaskAdded(final TaskModel task,
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$TaskAddedImpl;

  TaskModel get task;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$TaskAddedImplCopyWith<_$TaskAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDoneImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$TaskDoneImplCopyWith(
          _$TaskDoneImpl value, $Res Function(_$TaskDoneImpl) then) =
      __$$TaskDoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskModel task,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskDoneImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$TaskDoneImpl>
    implements _$$TaskDoneImplCopyWith<$Res> {
  __$$TaskDoneImplCopyWithImpl(
      _$TaskDoneImpl _value, $Res Function(_$TaskDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$TaskDoneImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskDoneImpl implements TaskDone {
  const _$TaskDoneImpl(this.task,
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final TaskModel task;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.taskDone(task: $task, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDoneImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      task,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDoneImplCopyWith<_$TaskDoneImpl> get copyWith =>
      __$$TaskDoneImplCopyWithImpl<_$TaskDoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return taskDone(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return taskDone?.call(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskDone != null) {
      return taskDone(task, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return taskDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return taskDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskDone != null) {
      return taskDone(this);
    }
    return orElse();
  }
}

abstract class TaskDone implements RemindersState {
  const factory TaskDone(final TaskModel task,
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$TaskDoneImpl;

  TaskModel get task;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$TaskDoneImplCopyWith<_$TaskDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskPostponedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$TaskPostponedImplCopyWith(
          _$TaskPostponedImpl value, $Res Function(_$TaskPostponedImpl) then) =
      __$$TaskPostponedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskModel task,
      Duration value,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskPostponedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$TaskPostponedImpl>
    implements _$$TaskPostponedImplCopyWith<$Res> {
  __$$TaskPostponedImplCopyWithImpl(
      _$TaskPostponedImpl _value, $Res Function(_$TaskPostponedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? value = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$TaskPostponedImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Duration,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskPostponedImpl implements TaskPostponed {
  const _$TaskPostponedImpl(this.task,
      {required this.value,
      required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final TaskModel task;
  @override
  final Duration value;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.taskPostponed(task: $task, value: $value, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskPostponedImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      task,
      value,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskPostponedImplCopyWith<_$TaskPostponedImpl> get copyWith =>
      __$$TaskPostponedImplCopyWithImpl<_$TaskPostponedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return taskPostponed(task, value, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return taskPostponed?.call(task, value, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskPostponed != null) {
      return taskPostponed(task, value, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return taskPostponed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return taskPostponed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskPostponed != null) {
      return taskPostponed(this);
    }
    return orElse();
  }
}

abstract class TaskPostponed implements RemindersState {
  const factory TaskPostponed(final TaskModel task,
      {required final Duration value,
      required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$TaskPostponedImpl;

  TaskModel get task;
  Duration get value;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$TaskPostponedImplCopyWith<_$TaskPostponedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDeletedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$TaskDeletedImplCopyWith(
          _$TaskDeletedImpl value, $Res Function(_$TaskDeletedImpl) then) =
      __$$TaskDeletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskModel task,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskDeletedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$TaskDeletedImpl>
    implements _$$TaskDeletedImplCopyWith<$Res> {
  __$$TaskDeletedImplCopyWithImpl(
      _$TaskDeletedImpl _value, $Res Function(_$TaskDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$TaskDeletedImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskDeletedImpl implements TaskDeleted {
  const _$TaskDeletedImpl(this.task,
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final TaskModel task;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.taskDeleted(task: $task, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDeletedImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      task,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDeletedImplCopyWith<_$TaskDeletedImpl> get copyWith =>
      __$$TaskDeletedImplCopyWithImpl<_$TaskDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return taskDeleted(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return taskDeleted?.call(task, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted(task, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return taskDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return taskDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted(this);
    }
    return orElse();
  }
}

abstract class TaskDeleted implements RemindersState {
  const factory TaskDeleted(final TaskModel task,
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$TaskDeletedImpl;

  TaskModel get task;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$TaskDeletedImplCopyWith<_$TaskDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineAddedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$MedicineAddedImplCopyWith(
          _$MedicineAddedImpl value, $Res Function(_$MedicineAddedImpl) then) =
      __$$MedicineAddedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MedicineModel medicine,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicineAddedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$MedicineAddedImpl>
    implements _$$MedicineAddedImplCopyWith<$Res> {
  __$$MedicineAddedImplCopyWithImpl(
      _$MedicineAddedImpl _value, $Res Function(_$MedicineAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$MedicineAddedImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicineAddedImpl implements MedicineAdded {
  const _$MedicineAddedImpl(this.medicine,
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final MedicineModel medicine;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.medicineAdded(medicine: $medicine, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineAddedImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      medicine,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineAddedImplCopyWith<_$MedicineAddedImpl> get copyWith =>
      __$$MedicineAddedImplCopyWithImpl<_$MedicineAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return medicineAdded(medicine, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return medicineAdded?.call(medicine, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineAdded != null) {
      return medicineAdded(medicine, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return medicineAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return medicineAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineAdded != null) {
      return medicineAdded(this);
    }
    return orElse();
  }
}

abstract class MedicineAdded implements RemindersState {
  const factory MedicineAdded(final MedicineModel medicine,
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$MedicineAddedImpl;

  MedicineModel get medicine;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$MedicineAddedImplCopyWith<_$MedicineAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineDoneImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$MedicineDoneImplCopyWith(
          _$MedicineDoneImpl value, $Res Function(_$MedicineDoneImpl) then) =
      __$$MedicineDoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MedicineModel medicine,
      DateTime at,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicineDoneImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$MedicineDoneImpl>
    implements _$$MedicineDoneImplCopyWith<$Res> {
  __$$MedicineDoneImplCopyWithImpl(
      _$MedicineDoneImpl _value, $Res Function(_$MedicineDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? at = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$MedicineDoneImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicineDoneImpl implements MedicineDone {
  const _$MedicineDoneImpl(this.medicine,
      {required this.at,
      required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final MedicineModel medicine;
  @override
  final DateTime at;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.medicineDone(medicine: $medicine, at: $at, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineDoneImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      medicine,
      at,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineDoneImplCopyWith<_$MedicineDoneImpl> get copyWith =>
      __$$MedicineDoneImplCopyWithImpl<_$MedicineDoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return medicineDone(medicine, at, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return medicineDone?.call(medicine, at, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineDone != null) {
      return medicineDone(medicine, at, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return medicineDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return medicineDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineDone != null) {
      return medicineDone(this);
    }
    return orElse();
  }
}

abstract class MedicineDone implements RemindersState {
  const factory MedicineDone(final MedicineModel medicine,
      {required final DateTime at,
      required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$MedicineDoneImpl;

  MedicineModel get medicine;
  DateTime get at;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$MedicineDoneImplCopyWith<_$MedicineDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicinePostponedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$MedicinePostponedImplCopyWith(_$MedicinePostponedImpl value,
          $Res Function(_$MedicinePostponedImpl) then) =
      __$$MedicinePostponedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MedicineModel medicine,
      Duration value,
      DateTime doseTime,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicinePostponedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$MedicinePostponedImpl>
    implements _$$MedicinePostponedImplCopyWith<$Res> {
  __$$MedicinePostponedImplCopyWithImpl(_$MedicinePostponedImpl _value,
      $Res Function(_$MedicinePostponedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? value = null,
    Object? doseTime = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$MedicinePostponedImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Duration,
      doseTime: null == doseTime
          ? _value.doseTime
          : doseTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicinePostponedImpl implements MedicinePostponed {
  const _$MedicinePostponedImpl(this.medicine,
      {required this.value,
      required this.doseTime,
      required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final MedicineModel medicine;
  @override
  final Duration value;
  @override
  final DateTime doseTime;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.medicinePostponed(medicine: $medicine, value: $value, doseTime: $doseTime, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicinePostponedImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.doseTime, doseTime) ||
                other.doseTime == doseTime) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      medicine,
      value,
      doseTime,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicinePostponedImplCopyWith<_$MedicinePostponedImpl> get copyWith =>
      __$$MedicinePostponedImplCopyWithImpl<_$MedicinePostponedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return medicinePostponed(
        medicine, value, doseTime, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return medicinePostponed?.call(
        medicine, value, doseTime, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicinePostponed != null) {
      return medicinePostponed(
          medicine, value, doseTime, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return medicinePostponed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return medicinePostponed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicinePostponed != null) {
      return medicinePostponed(this);
    }
    return orElse();
  }
}

abstract class MedicinePostponed implements RemindersState {
  const factory MedicinePostponed(final MedicineModel medicine,
      {required final Duration value,
      required final DateTime doseTime,
      required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$MedicinePostponedImpl;

  MedicineModel get medicine;
  Duration get value;
  DateTime get doseTime;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$MedicinePostponedImplCopyWith<_$MedicinePostponedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineDeletedImplCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$MedicineDeletedImplCopyWith(_$MedicineDeletedImpl value,
          $Res Function(_$MedicineDeletedImpl) then) =
      __$$MedicineDeletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MedicineModel medicine,
      DateTime selectedDay,
      List<TaskModel> tasks,
      List<MedicineModel> medicines});

  $MedicineModelCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$MedicineDeletedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$MedicineDeletedImpl>
    implements _$$MedicineDeletedImplCopyWith<$Res> {
  __$$MedicineDeletedImplCopyWithImpl(
      _$MedicineDeletedImpl _value, $Res Function(_$MedicineDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? selectedDay = null,
    Object? tasks = null,
    Object? medicines = null,
  }) {
    return _then(_$MedicineDeletedImpl(
      null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as MedicineModel,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      medicines: null == medicines
          ? _value._medicines
          : medicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicineModelCopyWith<$Res> get medicine {
    return $MedicineModelCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }
}

/// @nodoc

class _$MedicineDeletedImpl implements MedicineDeleted {
  const _$MedicineDeletedImpl(this.medicine,
      {required this.selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines})
      : _tasks = tasks,
        _medicines = medicines;

  @override
  final MedicineModel medicine;
  @override
  final DateTime selectedDay;
  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<MedicineModel> _medicines;
  @override
  List<MedicineModel> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'RemindersState.medicineDeleted(medicine: $medicine, selectedDay: $selectedDay, tasks: $tasks, medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineDeletedImpl &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._medicines, _medicines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      medicine,
      selectedDay,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_medicines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineDeletedImplCopyWith<_$MedicineDeletedImpl> get copyWith =>
      __$$MedicineDeletedImplCopyWithImpl<_$MedicineDeletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        initial,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        loading,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        remindersRefreshed,
    required TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)
        daySelected,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskAdded,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDone,
    required TResult Function(
            TaskModel task,
            Duration value,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        taskPostponed,
    required TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        taskDeleted,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineAdded,
    required TResult Function(
            MedicineModel medicine,
            DateTime at,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicineDone,
    required TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)
        medicinePostponed,
    required TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)
        medicineDeleted,
  }) {
    return medicineDeleted(medicine, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult? Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult? Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult? Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult? Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult? Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult? Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
  }) {
    return medicineDeleted?.call(medicine, selectedDay, tasks, medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        initial,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        loading,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        remindersRefreshed,
    TResult Function(DateTime selectedDay, List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        daySelected,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskAdded,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDone,
    TResult Function(TaskModel task, Duration value, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskPostponed,
    TResult Function(TaskModel task, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        taskDeleted,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineAdded,
    TResult Function(MedicineModel medicine, DateTime at, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDone,
    TResult Function(
            MedicineModel medicine,
            Duration value,
            DateTime doseTime,
            DateTime selectedDay,
            List<TaskModel> tasks,
            List<MedicineModel> medicines)?
        medicinePostponed,
    TResult Function(MedicineModel medicine, DateTime selectedDay,
            List<TaskModel> tasks, List<MedicineModel> medicines)?
        medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineDeleted != null) {
      return medicineDeleted(medicine, selectedDay, tasks, medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersRefreshed value) remindersRefreshed,
    required TResult Function(DaySelected value) daySelected,
    required TResult Function(TaskAdded value) taskAdded,
    required TResult Function(TaskDone value) taskDone,
    required TResult Function(TaskPostponed value) taskPostponed,
    required TResult Function(TaskDeleted value) taskDeleted,
    required TResult Function(MedicineAdded value) medicineAdded,
    required TResult Function(MedicineDone value) medicineDone,
    required TResult Function(MedicinePostponed value) medicinePostponed,
    required TResult Function(MedicineDeleted value) medicineDeleted,
  }) {
    return medicineDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersRefreshed value)? remindersRefreshed,
    TResult? Function(DaySelected value)? daySelected,
    TResult? Function(TaskAdded value)? taskAdded,
    TResult? Function(TaskDone value)? taskDone,
    TResult? Function(TaskPostponed value)? taskPostponed,
    TResult? Function(TaskDeleted value)? taskDeleted,
    TResult? Function(MedicineAdded value)? medicineAdded,
    TResult? Function(MedicineDone value)? medicineDone,
    TResult? Function(MedicinePostponed value)? medicinePostponed,
    TResult? Function(MedicineDeleted value)? medicineDeleted,
  }) {
    return medicineDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersRefreshed value)? remindersRefreshed,
    TResult Function(DaySelected value)? daySelected,
    TResult Function(TaskAdded value)? taskAdded,
    TResult Function(TaskDone value)? taskDone,
    TResult Function(TaskPostponed value)? taskPostponed,
    TResult Function(TaskDeleted value)? taskDeleted,
    TResult Function(MedicineAdded value)? medicineAdded,
    TResult Function(MedicineDone value)? medicineDone,
    TResult Function(MedicinePostponed value)? medicinePostponed,
    TResult Function(MedicineDeleted value)? medicineDeleted,
    required TResult orElse(),
  }) {
    if (medicineDeleted != null) {
      return medicineDeleted(this);
    }
    return orElse();
  }
}

abstract class MedicineDeleted implements RemindersState {
  const factory MedicineDeleted(final MedicineModel medicine,
      {required final DateTime selectedDay,
      required final List<TaskModel> tasks,
      required final List<MedicineModel> medicines}) = _$MedicineDeletedImpl;

  MedicineModel get medicine;
  @override
  DateTime get selectedDay;
  @override
  List<TaskModel> get tasks;
  @override
  List<MedicineModel> get medicines;
  @override
  @JsonKey(ignore: true)
  _$$MedicineDeletedImplCopyWith<_$MedicineDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
