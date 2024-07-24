import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectionStream with ChangeNotifier {
  StreamSubscription<ConnectivityResult>? onConnectivityChangedStream;

  bool isUserHaveInternetConnection = false, showInternetConnection = true;
  late Connectivity _connectivity;

  InternetConnectionStream() {
    _connectivity = Connectivity();
    onConnectivityChangedStream =
        _connectivity.onConnectivityChanged.listen((result) {
      _checkInternetConnectivity(result: result);
    })
          ..resume();
  }

  Future<void> _checkInternetConnectivity({ConnectivityResult? result}) async {
    var newResult = result ?? await _connectivity.checkConnectivity();

    ///TODO
    if (newResult != ConnectivityResult.none) {
      _changeUserHaveInternetConnection(
          true); // Уведомляем о наличии интернет-соединения
    } else {
      _changeUserHaveInternetConnection(
          false); // Уведомляем об отсутствии интернет-соединения
    }
  }

  void _changeUserHaveInternetConnection(bool value) async {
    isUserHaveInternetConnection = value;

    showInternetConnection = true;
    notifyListeners();

    if (value) {
      _showConnection();
    }
  }

  void _showConnection() async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      showInternetConnection = false;
      notifyListeners();
    });
  }

  void pause() {
    onConnectivityChangedStream!.pause();
  }

  void resume() {
    onConnectivityChangedStream!.resume();
  }

  void cancel() {
    onConnectivityChangedStream!.cancel();
  }
}
