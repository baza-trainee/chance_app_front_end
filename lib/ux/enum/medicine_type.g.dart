// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineTypeAdapter extends TypeAdapter<MedicineType> {
  @override
  final int typeId = 100;

  @override
  MedicineType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MedicineType.pill;
      case 1:
        return MedicineType.injection;
      case 2:
        return MedicineType.solution;
      case 3:
        return MedicineType.drops;
      case 4:
        return MedicineType.powder;
      case 5:
        return MedicineType.other;
      default:
        return MedicineType.pill;
    }
  }

  @override
  void write(BinaryWriter writer, MedicineType obj) {
    switch (obj) {
      case MedicineType.pill:
        writer.writeByte(0);
        break;
      case MedicineType.injection:
        writer.writeByte(1);
        break;
      case MedicineType.solution:
        writer.writeByte(2);
        break;
      case MedicineType.drops:
        writer.writeByte(3);
        break;
      case MedicineType.powder:
        writer.writeByte(4);
        break;
      case MedicineType.other:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
