import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerMainScreen {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/6300978111"; //дебаг
      }

      //return "ca-app-pub-3940256099942544/6300978111"; //релиз
      return "ca-app-pub-8751007823546645/5538385601";//релиз
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/2934735716";//дебаг
      } else {
        return "ca-app-pub-3940256099942544/6300978111";//релиз
        //return "ca-app-pub-8751007823546645/6024389190";//релиз

      }
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerInList {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/6300978111"; //дебаг
      }

      return ""; //релиз
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/2934735716";//дебаг
      } else {
        return "";//релиз
      }
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardAd {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/5224354917"; //дебаг
      }

      return ""; //релиз
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/1712485313";//дебаг
      } else {
        return "";//релиз
      }
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
