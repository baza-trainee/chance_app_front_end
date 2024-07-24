// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoundsAdapter extends TypeAdapter<Bounds> {
  @override
  final int typeId = 12;

  @override
  Bounds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bounds(
      northeast: fields[0] as Location,
      southwest: fields[1] as Location,
    );
  }

  @override
  void write(BinaryWriter writer, Bounds obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.northeast)
      ..writeByte(1)
      ..write(obj.southwest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoundsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoundsImpl _$$BoundsImplFromJson(Map<String, dynamic> json) => _$BoundsImpl(
      northeast: Location.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: Location.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoundsImplToJson(_$BoundsImpl instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };
