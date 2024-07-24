// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressComponentAdapter extends TypeAdapter<AddressComponent> {
  @override
  final int typeId = 13;

  @override
  AddressComponent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressComponent(
      types: (fields[0] as List).cast<String>(),
      longName: fields[1] as String,
      shortName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressComponent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.types)
      ..writeByte(1)
      ..write(obj.longName)
      ..writeByte(2)
      ..write(obj.shortName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressComponentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressComponentImpl _$$AddressComponentImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressComponentImpl(
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
    );

Map<String, dynamic> _$$AddressComponentImplToJson(
        _$AddressComponentImpl instance) =>
    <String, dynamic>{
      'types': instance.types,
      'long_name': instance.longName,
      'short_name': instance.shortName,
    };
