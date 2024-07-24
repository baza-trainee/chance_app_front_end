// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvitationModelAdapter extends TypeAdapter<InvitationModel> {
  @override
  final int typeId = 6;

  @override
  InvitationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvitationModel(
      id: fields[0] as String,
      toUserEmail: fields[1] as String,
      toUserName: fields[2] as String,
      sentDate: fields[3] as DateTime?,
      fromUserEmail: fields[4] as String,
      fromUserName: fields[5] as String,
      invitationStatus: fields[6] as InvitationStatus,
    );
  }

  @override
  void write(BinaryWriter writer, InvitationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.toUserEmail)
      ..writeByte(2)
      ..write(obj.toUserName)
      ..writeByte(3)
      ..write(obj.sentDate)
      ..writeByte(4)
      ..write(obj.fromUserEmail)
      ..writeByte(5)
      ..write(obj.fromUserName)
      ..writeByte(6)
      ..write(obj.invitationStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvitationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationModelImpl _$$InvitationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationModelImpl(
      id: json['id'] as String,
      toUserEmail: json['toUserEmail'] as String,
      toUserName: json['toUserName'] as String,
      sentDate: json['sentDate'] == null
          ? null
          : DateTime.parse(json['sentDate'] as String),
      fromUserEmail: json['fromUserEmail'] as String,
      fromUserName: json['fromUserName'] as String,
      invitationStatus: $enumDecodeNullable(
              _$InvitationStatusEnumMap, json['invitationStatus']) ??
          InvitationStatus.pending,
    );

Map<String, dynamic> _$$InvitationModelImplToJson(
        _$InvitationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toUserEmail': instance.toUserEmail,
      'toUserName': instance.toUserName,
      'sentDate': instance.sentDate?.toIso8601String(),
      'fromUserEmail': instance.fromUserEmail,
      'fromUserName': instance.fromUserName,
      'invitationStatus': _$InvitationStatusEnumMap[instance.invitationStatus]!,
    };

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'pending',
  InvitationStatus.accepted: 'accepted',
  InvitationStatus.error: 'error',
  InvitationStatus.canceled: 'canceled',
};
