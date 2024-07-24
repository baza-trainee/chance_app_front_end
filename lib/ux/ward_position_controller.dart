import 'dart:async';

import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/internet_connection_stream.dart';
import 'package:chance_app/ux/model/ward_location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WardPositionController with ChangeNotifier {
  StreamSubscription<WardLocationModel?>? _stream;
  InternetConnectionStream internetConnectionStream =
      InternetConnectionStream();

  WardPositionController(BuildContext context) {
    bool isUserHaveInternetConnection =
        internetConnectionStream.isUserHaveInternetConnection;
    try {
      if (_stream == null) {
        _handleChange(context);
        resume();
      }
    } catch (_) {}
    internetConnectionStream.addListener(() {
      isUserHaveInternetConnection =
          internetConnectionStream.isUserHaveInternetConnection;

      if (isUserHaveInternetConnection) {
        if (_stream == null) {
          _handleChange(context);
        }
        resume();
      } else {
        pause();
      }
    });
  }

  void _handleChange(BuildContext context) {
    _stream = Supabase.instance.client
        .from('ward_location')
        .stream(primaryKey: ['id']).map<WardLocationModel?>((maps) {
      List<WardLocationModel> list =
          maps.map((map) => WardLocationModel.fromJson(map)).toList();
      if (maps
          .toList()
          .any((element) => element["toUserEmail"] == HiveCRUD().user!.email)) {
        return list.firstWhere(
            (element) => element.toUserEmail == HiveCRUD().user!.email);
      }
      return null;
    }).listen((event) {
      if (event != null) {
        try {
          BlocProvider.of<NavigationBloc>(context)
              .add(ChangeWardLocation(event));
        } catch (_) {}
      }
    });
  }

  void cancel() {
    final stream = _stream;
    if (stream != null) {
      stream.cancel();
    }
  }

  void pause() {
    final stream = _stream;
    if (stream != null) {
      stream.pause();
    }
  }

  void resume() {
    final stream = _stream;
    if (stream != null) {
      stream.resume();
    }
  }
}
