// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WardLocationModelAdapter extends TypeAdapter<WardLocationModel> {
  @override
  final int typeId = 6;

  @override
  WardLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WardLocationModel(
      id: fields[0] as String,
      myEmail: fields[1] as String,
      myName: fields[2] as String,
      latitude: fields[3] as double,
      longitude: fields[4] as double,
      toUserEmail: fields[5] as String,
      when: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WardLocationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.myEmail)
      ..writeByte(2)
      ..write(obj.myName)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.toUserEmail)
      ..writeByte(6)
      ..write(obj.when);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WardLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WardLocationModelImpl _$$WardLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WardLocationModelImpl(
      id: json['id'] as String,
      myEmail: json['myEmail'] as String,
      myName: json['myName'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      toUserEmail: json['toUserEmail'] as String,
      when: DateTime.parse(json['when'] as String),
    );

Map<String, dynamic> _$$WardLocationModelImplToJson(
        _$WardLocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'myEmail': instance.myEmail,
      'myName': instance.myName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'toUserEmail': instance.toUserEmail,
      'when': instance.when.toIso8601String(),
    };
