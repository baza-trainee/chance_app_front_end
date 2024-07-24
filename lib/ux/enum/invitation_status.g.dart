// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvitationStatusAdapter extends TypeAdapter<InvitationStatus> {
  @override
  final int typeId = 104;

  @override
  InvitationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return InvitationStatus.pending;
      case 1:
        return InvitationStatus.accepted;
      case 2:
        return InvitationStatus.error;
      case 3:
        return InvitationStatus.canceled;
      default:
        return InvitationStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, InvitationStatus obj) {
    switch (obj) {
      case InvitationStatus.pending:
        writer.writeByte(0);
        break;
      case InvitationStatus.accepted:
        writer.writeByte(1);
        break;
      case InvitationStatus.error:
        writer.writeByte(2);
        break;
      case InvitationStatus.canceled:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvitationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
