// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SosContactModelAdapter extends TypeAdapter<SosContactModel> {
  @override
  final int typeId = 2;

  @override
  SosContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SosContactModel(
      name: fields[1] as String,
      phone: fields[2] as String,
      groupName: fields[3] as String,
      id: fields[4] as String,
      contactsId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SosContactModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.groupName)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.contactsId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SosContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SosGroupModelAdapter extends TypeAdapter<SosGroupModel> {
  @override
  final int typeId = 17;

  @override
  SosGroupModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SosGroupModel(
      id: fields[1] as String,
      name: fields[2] as String,
      contacts: (fields[3] as List).cast<SosContactModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SosGroupModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.contacts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SosGroupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      groupName: json['groupName'] as String? ?? "",
      id: json['id'] as String? ?? "",
      contactsId: json['contactsId'] as String? ?? "",
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'groupName': instance.groupName,
      'id': instance.id,
      'contactsId': instance.contactsId,
    };

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => SosContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contacts': instance.contacts,
    };
