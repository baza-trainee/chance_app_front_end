// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstructionAdapter extends TypeAdapter<Instruction> {
  @override
  final int typeId = 102;

  @override
  Instruction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Instruction.beforeEating;
      case 1:
        return Instruction.whileEating;
      case 2:
        return Instruction.afterEating;
      case 3:
        return Instruction.noMatter;
      default:
        return Instruction.beforeEating;
    }
  }

  @override
  void write(BinaryWriter writer, Instruction obj) {
    switch (obj) {
      case Instruction.beforeEating:
        writer.writeByte(0);
        break;
      case Instruction.whileEating:
        writer.writeByte(1);
        break;
      case Instruction.afterEating:
        writer.writeByte(2);
        break;
      case Instruction.noMatter:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
