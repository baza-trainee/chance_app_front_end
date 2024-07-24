// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) {
  return _MedicineModel.fromJson(json);
}

/// @nodoc
mixin _$MedicineModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  MedicineType get type => throw _privateConstructorUsedError;
  @HiveField(4)
  Periodicity get periodicity => throw _privateConstructorUsedError;
  @HiveField(5)
  @DateConverter()
  DateTime get startDate => throw _privateConstructorUsedError;
  @HiveField(6)
  List<int> get weekdays =>
      throw _privateConstructorUsedError; // if Periodicity.certainDays
  @HiveField(7)
  Map<int, int> get doses =>
      throw _privateConstructorUsedError; // offset in min.: dose count
  @HiveField(8)
  Instruction get instruction => throw _privateConstructorUsedError;
  @HiveField(9)
  List<DateTime> get doneAt =>
      throw _privateConstructorUsedError; // as it's a regular event
  @HiveField(10)
  Map<DateTime, int> get rescheduledOn =>
      throw _privateConstructorUsedError; // dose: min.
  @HiveField(11)
  bool get isRemoved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicineModelCopyWith<MedicineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineModelCopyWith<$Res> {
  factory $MedicineModelCopyWith(
          MedicineModel value, $Res Function(MedicineModel) then) =
      _$MedicineModelCopyWithImpl<$Res, MedicineModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) DateTime updatedAt,
      @HiveField(2) String name,
      @HiveField(3) MedicineType type,
      @HiveField(4) Periodicity periodicity,
      @HiveField(5) @DateConverter() DateTime startDate,
      @HiveField(6) List<int> weekdays,
      @HiveField(7) Map<int, int> doses,
      @HiveField(8) Instruction instruction,
      @HiveField(9) List<DateTime> doneAt,
      @HiveField(10) Map<DateTime, int> rescheduledOn,
      @HiveField(11) bool isRemoved});
}

/// @nodoc
class _$MedicineModelCopyWithImpl<$Res, $Val extends MedicineModel>
    implements $MedicineModelCopyWith<$Res> {
  _$MedicineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? type = null,
    Object? periodicity = null,
    Object? startDate = null,
    Object? weekdays = null,
    Object? doses = null,
    Object? instruction = null,
    Object? doneAt = null,
    Object? rescheduledOn = null,
    Object? isRemoved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineType,
      periodicity: null == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as Periodicity,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      doses: null == doses
          ? _value.doses
          : doses // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as Instruction,
      doneAt: null == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      rescheduledOn: null == rescheduledOn
          ? _value.rescheduledOn
          : rescheduledOn // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicineModelImplCopyWith<$Res>
    implements $MedicineModelCopyWith<$Res> {
  factory _$$MedicineModelImplCopyWith(
          _$MedicineModelImpl value, $Res Function(_$MedicineModelImpl) then) =
      __$$MedicineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) DateTime updatedAt,
      @HiveField(2) String name,
      @HiveField(3) MedicineType type,
      @HiveField(4) Periodicity periodicity,
      @HiveField(5) @DateConverter() DateTime startDate,
      @HiveField(6) List<int> weekdays,
      @HiveField(7) Map<int, int> doses,
      @HiveField(8) Instruction instruction,
      @HiveField(9) List<DateTime> doneAt,
      @HiveField(10) Map<DateTime, int> rescheduledOn,
      @HiveField(11) bool isRemoved});
}

/// @nodoc
class __$$MedicineModelImplCopyWithImpl<$Res>
    extends _$MedicineModelCopyWithImpl<$Res, _$MedicineModelImpl>
    implements _$$MedicineModelImplCopyWith<$Res> {
  __$$MedicineModelImplCopyWithImpl(
      _$MedicineModelImpl _value, $Res Function(_$MedicineModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? type = null,
    Object? periodicity = null,
    Object? startDate = null,
    Object? weekdays = null,
    Object? doses = null,
    Object? instruction = null,
    Object? doneAt = null,
    Object? rescheduledOn = null,
    Object? isRemoved = null,
  }) {
    return _then(_$MedicineModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineType,
      periodicity: null == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as Periodicity,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekdays: null == weekdays
          ? _value._weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      doses: null == doses
          ? _value._doses
          : doses // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as Instruction,
      doneAt: null == doneAt
          ? _value._doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      rescheduledOn: null == rescheduledOn
          ? _value._rescheduledOn
          : rescheduledOn // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicineModelImpl extends _MedicineModel {
  const _$MedicineModelImpl(
      {@HiveField(0) @JsonKey(name: "_id") required this.id,
      @HiveField(1) required this.updatedAt,
      @HiveField(2) required this.name,
      @HiveField(3) required this.type,
      @HiveField(4) required this.periodicity,
      @HiveField(5) @DateConverter() required this.startDate,
      @HiveField(6) final List<int> weekdays = const [],
      @HiveField(7) required final Map<int, int> doses,
      @HiveField(8) this.instruction = Instruction.noMatter,
      @HiveField(9) final List<DateTime> doneAt = const [],
      @HiveField(10) final Map<DateTime, int> rescheduledOn = const {},
      @HiveField(11) this.isRemoved = false})
      : _weekdays = weekdays,
        _doses = doses,
        _doneAt = doneAt,
        _rescheduledOn = rescheduledOn,
        super._();

  factory _$MedicineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  final String id;
  @override
  @HiveField(1)
  final DateTime updatedAt;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final MedicineType type;
  @override
  @HiveField(4)
  final Periodicity periodicity;
  @override
  @HiveField(5)
  @DateConverter()
  final DateTime startDate;
  final List<int> _weekdays;
  @override
  @JsonKey()
  @HiveField(6)
  List<int> get weekdays {
    if (_weekdays is EqualUnmodifiableListView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdays);
  }

// if Periodicity.certainDays
  final Map<int, int> _doses;
// if Periodicity.certainDays
  @override
  @HiveField(7)
  Map<int, int> get doses {
    if (_doses is EqualUnmodifiableMapView) return _doses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_doses);
  }

// offset in min.: dose count
  @override
  @JsonKey()
  @HiveField(8)
  final Instruction instruction;
  final List<DateTime> _doneAt;
  @override
  @JsonKey()
  @HiveField(9)
  List<DateTime> get doneAt {
    if (_doneAt is EqualUnmodifiableListView) return _doneAt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doneAt);
  }

// as it's a regular event
  final Map<DateTime, int> _rescheduledOn;
// as it's a regular event
  @override
  @JsonKey()
  @HiveField(10)
  Map<DateTime, int> get rescheduledOn {
    if (_rescheduledOn is EqualUnmodifiableMapView) return _rescheduledOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rescheduledOn);
  }

// dose: min.
  @override
  @JsonKey()
  @HiveField(11)
  final bool isRemoved;

  @override
  String toString() {
    return 'MedicineModel(id: $id, updatedAt: $updatedAt, name: $name, type: $type, periodicity: $periodicity, startDate: $startDate, weekdays: $weekdays, doses: $doses, instruction: $instruction, doneAt: $doneAt, rescheduledOn: $rescheduledOn, isRemoved: $isRemoved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
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
            const DeepCollectionEquality().equals(other._doneAt, _doneAt) &&
            const DeepCollectionEquality()
                .equals(other._rescheduledOn, _rescheduledOn) &&
            (identical(other.isRemoved, isRemoved) ||
                other.isRemoved == isRemoved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      updatedAt,
      name,
      type,
      periodicity,
      startDate,
      const DeepCollectionEquality().hash(_weekdays),
      const DeepCollectionEquality().hash(_doses),
      instruction,
      const DeepCollectionEquality().hash(_doneAt),
      const DeepCollectionEquality().hash(_rescheduledOn),
      isRemoved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineModelImplCopyWith<_$MedicineModelImpl> get copyWith =>
      __$$MedicineModelImplCopyWithImpl<_$MedicineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineModelImplToJson(
      this,
    );
  }
}

abstract class _MedicineModel extends MedicineModel {
  const factory _MedicineModel(
      {@HiveField(0) @JsonKey(name: "_id") required final String id,
      @HiveField(1) required final DateTime updatedAt,
      @HiveField(2) required final String name,
      @HiveField(3) required final MedicineType type,
      @HiveField(4) required final Periodicity periodicity,
      @HiveField(5) @DateConverter() required final DateTime startDate,
      @HiveField(6) final List<int> weekdays,
      @HiveField(7) required final Map<int, int> doses,
      @HiveField(8) final Instruction instruction,
      @HiveField(9) final List<DateTime> doneAt,
      @HiveField(10) final Map<DateTime, int> rescheduledOn,
      @HiveField(11) final bool isRemoved}) = _$MedicineModelImpl;
  const _MedicineModel._() : super._();

  factory _MedicineModel.fromJson(Map<String, dynamic> json) =
      _$MedicineModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id;
  @override
  @HiveField(1)
  DateTime get updatedAt;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  MedicineType get type;
  @override
  @HiveField(4)
  Periodicity get periodicity;
  @override
  @HiveField(5)
  @DateConverter()
  DateTime get startDate;
  @override
  @HiveField(6)
  List<int> get weekdays;
  @override // if Periodicity.certainDays
  @HiveField(7)
  Map<int, int> get doses;
  @override // offset in min.: dose count
  @HiveField(8)
  Instruction get instruction;
  @override
  @HiveField(9)
  List<DateTime> get doneAt;
  @override // as it's a regular event
  @HiveField(10)
  Map<DateTime, int> get rescheduledOn;
  @override // dose: min.
  @HiveField(11)
  bool get isRemoved;
  @override
  @JsonKey(ignore: true)
  _$$MedicineModelImplCopyWith<_$MedicineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
