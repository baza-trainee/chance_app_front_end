// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_periodicity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayPeriodicityAdapter extends TypeAdapter<DayPeriodicity> {
  @override
  final int typeId = 103;

  @override
  DayPeriodicity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayPeriodicity.once;
      case 1:
        return DayPeriodicity.twice;
      case 2:
        return DayPeriodicity.other;
      default:
        return DayPeriodicity.once;
    }
  }

  @override
  void write(BinaryWriter writer, DayPeriodicity obj) {
    switch (obj) {
      case DayPeriodicity.once:
        writer.writeByte(0);
        break;
      case DayPeriodicity.twice:
        writer.writeByte(1);
        break;
      case DayPeriodicity.other:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayPeriodicityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
