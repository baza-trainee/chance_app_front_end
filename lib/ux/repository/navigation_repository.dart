import 'dart:async';
import 'dart:convert';

import 'package:chance_app/api_keys.dart';
import 'package:chance_app/main.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class NavigationRepository {
  Future<LatLng?> getLocationFromPlaceId(PickResult pickResult) async {
    LatLng? latLng;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      return null;
    } else {
      try {
        Uri uri = Uri.parse(
            "https://maps.googleapis.com/maps/api/place/details/json?fields=geometry&place_id=${pickResult.placeId}&key=$googleAPIKey");
        await http.post(uri, headers: <String, String>{
          'Content-Type': 'application/json',
        }).then((value) async {
          if (value.statusCode > 199 && value.statusCode < 300) {
            Map<String, dynamic> map = jsonDecode(value.body);
            latLng = LatLng(map["result"]["geometry"]["location"]["lat"],
                map["result"]["geometry"]["location"]["lng"]);
          }
        });
      } catch (e, trace) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return latLng;
  }

  Future<String?> sendMyLocation(double latitude, double longitude) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      return "noInternetConnection";
    } else {
      try {
        await Supabase.instance.client.from("ward_location").update({
          "latitude": latitude,
          "longitude": longitude,
          "when": DateTime.now().toIso8601String(),
        }).match({"myEmail": HiveCRUD().user!.email}).then((value) {});
      } catch (e, trace) {
        error = e.toString();
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return error;
  }

  Future<LatLng?> getWardLocation(String wardEmail) async {
    LatLng? latLng;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      return null;
    } else {
      try {
        await Supabase.instance.client
            .from("ward_location")
            .select()
            .match({"myEmail": wardEmail}).then((value) {
          List<dynamic> list = value;
          latLng = LatLng(double.parse(list[0]["latitude"].toString()),
              double.parse(list[0]["longitude"].toString()));
        });
      } catch (e, trace) {
        Fluttertoast.showToast(msg: e.toString());
        FirebaseCrashlytics.instance.recordError(e.toString(), trace);
      }
    }
    return latLng;
  }

  Future<String?> isAppShouldSentLocation() async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      if (whichToastIsShowing != "noInternetConnection") {
        whichToastIsShowing = "noInternetConnection";
        unawaited(Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          whichToastIsShowing = "";
        }));
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("noInternetConnection"),
            toastLength: Toast.LENGTH_LONG);
      }
      return "noInternetConnection";
    } else {
      if (HiveCRUD().user != null) {
        try {
          await Supabase.instance.client.rpc('isappshouldsentlocation',
              params: {
                "user_email": HiveCRUD().user!.email
              }).then((value) async {
            if (value != null) {
              try {
                HiveCRUD hiveCRUD = HiveCRUD();
                Settings? settings = hiveCRUD.setting;
                if (settings != null) {
                  bool isAppShouldSentLocation = bool.parse(value.toString());
                  settings = settings.copyWith(
                      isAppShouldSentLocation: isAppShouldSentLocation);
                  await hiveCRUD.updateSettings(settings);
                }
              } catch (e, trace) {
                FirebaseCrashlytics.instance.recordError(e.toString(), trace);
              }
            }
          });
        } catch (e, trace) {
          Fluttertoast.showToast(msg: e.toString());
          FirebaseCrashlytics.instance.recordError(e.toString(), trace);
        }
      } else {
        error = "noUser";
      }
    }

    return error;
  }
}
