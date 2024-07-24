// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      id: fields[0] as String,
      message: fields[1] as String,
      date: fields[2] as DateTime,
      isDone: fields[3] as bool,
      remindBefore: fields[4] as int?,
      isRemoved: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(4)
      ..write(obj.remindBefore)
      ..writeByte(5)
      ..write(obj.isRemoved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['_id'] as String,
      message: json['message'] as String,
      date: DateTime.parse(json['date'] as String),
      isDone: json['isDone'] as bool? ?? false,
      remindBefore: json['remindBefore'] as int?,
      isRemoved: json['isRemoved'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'date': instance.date.toIso8601String(),
      'isDone': instance.isDone,
      'remindBefore': instance.remindBefore,
      'isRemoved': instance.isRemoved,
    };
