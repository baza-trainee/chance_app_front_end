import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
@HiveType(typeId: HiveTypeId.settingsModel)
class Settings with _$Settings {
  const factory Settings({
    @HiveField(0) @Default(false) bool blockAd,
    @HiveField(1) @Default(true) bool soundsOn,
    @HiveField(2) @Default(null) DateTime? firstEnter,
    @HiveField(3) @Default(false) bool? isNotificationEnable,
    @HiveField(4) String? language,
    @HiveField(5) String? languageCode,
    @HiveField(6) @Default(false) bool isAppShouldSentLocation,
    @HiveField(7) @Default(false) bool dontShowInformationDialogBeforeOpenMap,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
