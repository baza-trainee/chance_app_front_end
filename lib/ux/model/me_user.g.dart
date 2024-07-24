// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeUserAdapter extends TypeAdapter<MeUser> {
  @override
  final int typeId = 1;

  @override
  MeUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeUser(
      id: fields[0] as String,
      name: fields[1] as String,
      lastName: fields[2] as String,
      phone: fields[3] as String,
      email: fields[4] as String,
      isGoogle: fields[5] as bool,
      isConfirmed: fields[6] as bool,
      deviceId: fields[7] as String?,
      mapType: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MeUser obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.isGoogle)
      ..writeByte(6)
      ..write(obj.isConfirmed)
      ..writeByte(7)
      ..write(obj.deviceId)
      ..writeByte(8)
      ..write(obj.mapType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeUserImpl _$$MeUserImplFromJson(Map<String, dynamic> json) => _$MeUserImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      email: json['email'] as String? ?? "",
      isGoogle: json['isGoogle'] as bool? ?? false,
      isConfirmed: json['isConfirmed'] as bool? ?? false,
      deviceId: json['deviceId'] as String? ?? null,
      mapType: json['mapType'] as int? ?? 0,
    );

Map<String, dynamic> _$$MeUserImplToJson(_$MeUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'isGoogle': instance.isGoogle,
      'isConfirmed': instance.isConfirmed,
      'deviceId': instance.deviceId,
      'mapType': instance.mapType,
    };
