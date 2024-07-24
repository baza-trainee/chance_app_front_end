// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get price => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get validity => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isRemoved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) String price,
      @HiveField(4) DateTime? validity,
      @HiveField(5) bool isRemoved});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? description = null,
    Object? price = null,
    Object? validity = freezed,
    Object? isRemoved = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) String price,
      @HiveField(4) DateTime? validity,
      @HiveField(5) bool isRemoved});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? description = null,
    Object? price = null,
    Object? validity = freezed,
    Object? isRemoved = null,
  }) {
    return _then(_$ProductModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {@HiveField(0) this.title = "",
      @HiveField(1) this.id = "",
      @HiveField(2) this.description = "",
      @HiveField(3) this.price = "",
      @HiveField(4) this.validity = null,
      @HiveField(5) this.isRemoved = false});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String title;
  @override
  @JsonKey()
  @HiveField(1)
  final String id;
  @override
  @JsonKey()
  @HiveField(2)
  final String description;
  @override
  @JsonKey()
  @HiveField(3)
  final String price;
  @override
  @JsonKey()
  @HiveField(4)
  final DateTime? validity;
  @override
  @JsonKey()
  @HiveField(5)
  final bool isRemoved;

  @override
  String toString() {
    return 'ProductModel(title: $title, id: $id, description: $description, price: $price, validity: $validity, isRemoved: $isRemoved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.validity, validity) ||
                other.validity == validity) &&
            (identical(other.isRemoved, isRemoved) ||
                other.isRemoved == isRemoved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, description, price, validity, isRemoved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {@HiveField(0) final String title,
      @HiveField(1) final String id,
      @HiveField(2) final String description,
      @HiveField(3) final String price,
      @HiveField(4) final DateTime? validity,
      @HiveField(5) final bool isRemoved}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String get price;
  @override
  @HiveField(4)
  DateTime? get validity;
  @override
  @HiveField(5)
  bool get isRemoved;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
