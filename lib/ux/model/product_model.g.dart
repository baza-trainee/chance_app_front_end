// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 4;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      title: fields[0] as String,
      id: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as String,
      validity: fields[4] as DateTime?,
      isRemoved: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.validity)
      ..writeByte(5)
      ..write(obj.isRemoved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      title: json['title'] as String? ?? "",
      id: json['id'] as String? ?? "",
      description: json['description'] as String? ?? "",
      price: json['price'] as String? ?? "",
      validity: json['validity'] == null
          ? null
          : DateTime.parse(json['validity'] as String),
      isRemoved: json['isRemoved'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'description': instance.description,
      'price': instance.price,
      'validity': instance.validity?.toIso8601String(),
      'isRemoved': instance.isRemoved,
    };
