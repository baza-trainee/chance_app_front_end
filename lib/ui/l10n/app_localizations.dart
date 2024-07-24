import 'dart:async';
import 'dart:convert';

import 'package:chance_app/ux/hive_crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? _instance;

  static AppLocalizations get instance {
    if (_instance == null) {
      return AppLocalizations(const Locale("en"));
    }

    return _instance!;
  }

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonString = "";
    String? languageCode = HiveCRUD().setting?.languageCode;
    if (languageCode != null &&
        const MyLocalizationsDelegate().isSupportedCode(languageCode)) {
      jsonString = await rootBundle
          .loadString('assets/localizations/app_$languageCode.arb');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      final instance = AppLocalizations(Locale(languageCode));
      instance._localizedValues = jsonMap.map(
        (key, value) => MapEntry(
          key,
          value is String ? value : (value as Map<String, dynamic>)['value'],
        ),
      );
      _instance = instance;
      return AppLocalizations(Locale(languageCode));
    } else {
      if (const MyLocalizationsDelegate()
          .isSupportedCode(locale.languageCode)) {
        jsonString = await rootBundle
            .loadString('assets/localizations/app_${locale.languageCode}.arb');
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

        final instance = AppLocalizations(locale);
        instance._localizedValues = jsonMap.map(
          (key, value) => MapEntry(
            key,
            value is String ? value : (value as Map<String, dynamic>)['value'],
          ),
        );
        _instance = instance;
        return AppLocalizations(locale);
      } else {
        jsonString =
            await rootBundle.loadString('assets/localizations/app_uk.arb');
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

        final instance = AppLocalizations(const Locale("en"));
        instance._localizedValues = jsonMap.map(
          (key, value) => MapEntry(
            key,
            value is String ? value : (value as Map<String, dynamic>)['value'],
          ),
        );
        _instance = instance;
        return AppLocalizations(const Locale("uk"));
      }
    }
  }

  Map<String, String> _localizedValues = {};

  String translate(String key) => _localizedValues[key] ?? key;

  Future changeLocale(String code) async {
    final jsonString =
        await rootBundle.loadString('assets/localizations/app_$code.arb');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    final instance = AppLocalizations(Locale(code));
    instance._localizedValues = jsonMap.map(
      (key, value) => MapEntry(
        key,
        value is String ? value : (value as Map<String, dynamic>)['value'],
      ),
    );
    _instance = instance;
    return AppLocalizations(Locale(code));
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const MyLocalizationsDelegate();

  bool isSupportedCode(String languageCode) {
    return [
      'uk',
      'en',
    ].contains(languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) {
    return [
      'uk',
      'en',
    ].contains(locale.languageCode);
  }
}
