// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periodicity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeriodicityAdapter extends TypeAdapter<Periodicity> {
  @override
  final int typeId = 101;

  @override
  Periodicity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Periodicity.everyDay;
      case 1:
        return Periodicity.inADay;
      case 2:
        return Periodicity.certainDays;
      default:
        return Periodicity.everyDay;
    }
  }

  @override
  void write(BinaryWriter writer, Periodicity obj) {
    switch (obj) {
      case Periodicity.everyDay:
        writer.writeByte(0);
        break;
      case Periodicity.inADay:
        writer.writeByte(1);
        break;
      case Periodicity.certainDays:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodicityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
