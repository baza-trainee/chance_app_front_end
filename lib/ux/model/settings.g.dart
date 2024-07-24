// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 3;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      blockAd: fields[0] as bool,
      soundsOn: fields[1] as bool,
      firstEnter: fields[2] as DateTime?,
      isNotificationEnable: fields[3] as bool?,
      language: fields[4] as String?,
      languageCode: fields[5] as String?,
      isAppShouldSentLocation: fields[6] as bool,
      dontShowInformationDialogBeforeOpenMap: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.blockAd)
      ..writeByte(1)
      ..write(obj.soundsOn)
      ..writeByte(2)
      ..write(obj.firstEnter)
      ..writeByte(3)
      ..write(obj.isNotificationEnable)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.languageCode)
      ..writeByte(6)
      ..write(obj.isAppShouldSentLocation)
      ..writeByte(7)
      ..write(obj.dontShowInformationDialogBeforeOpenMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      blockAd: json['blockAd'] as bool? ?? false,
      soundsOn: json['soundsOn'] as bool? ?? true,
      firstEnter: json['firstEnter'] == null
          ? null
          : DateTime.parse(json['firstEnter'] as String),
      isNotificationEnable: json['isNotificationEnable'] as bool? ?? false,
      language: json['language'] as String?,
      languageCode: json['languageCode'] as String?,
      isAppShouldSentLocation:
          json['isAppShouldSentLocation'] as bool? ?? false,
      dontShowInformationDialogBeforeOpenMap:
          json['dontShowInformationDialogBeforeOpenMap'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'blockAd': instance.blockAd,
      'soundsOn': instance.soundsOn,
      'firstEnter': instance.firstEnter?.toIso8601String(),
      'isNotificationEnable': instance.isNotificationEnable,
      'language': instance.language,
      'languageCode': instance.languageCode,
      'isAppShouldSentLocation': instance.isAppShouldSentLocation,
      'dontShowInformationDialogBeforeOpenMap':
          instance.dontShowInformationDialogBeforeOpenMap,
    };
