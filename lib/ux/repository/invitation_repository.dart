import 'dart:async';

import 'package:chance_app/main.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/enum/invitation_status.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/invitation_model.dart';
import 'package:chance_app/ux/model/settings.dart';
import 'package:chance_app/ux/model/ward_location_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InvitationRepository {
  Future<String?> sendConfirmToWard(String name, String email) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      final user = HiveCRUD().user!;
      final userEmail = user.email;
      await Supabase.instance.client
          .from("invitations")
          .select()
          .eq("toUserEmail", email)
          .eq("fromUserEmail", userEmail)
          .then((value) async {
        if (value.toString() == "[]") {
          final model = InvitationModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            toUserEmail: email,
            toUserName: name,
            sentDate: DateTime.now(),
            fromUserEmail: userEmail,
            fromUserName: "${user.name} ${user.lastName}",
            invitationStatus: InvitationStatus.pending,
          ).toJson();
          await Supabase.instance.client.from("invitations").insert(model);
        }
      });
    }

    return error;
  }

  Future<dynamic> getInvitationForMe() async {
    List<InvitationModel> invitations = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      return "noInternetConnection";
    } else {
      try {
        await Supabase.instance.client
            .from("invitations")
            .select()
            .eq("toUserEmail", HiveCRUD().user!.email)
            .eq("invitationStatus", InvitationStatus.pending.name)
            .then((value) {
          List<dynamic> list = value;
          for (int i = 0; i < list.length; i++) {
            invitations.add(InvitationModel.fromJson(list[i]));
          }
        });
      } catch (e) {
        return e.toString();
      }
    }
    return invitations;
  }

  Future<dynamic> getInvitationFromMe() async {
    List<InvitationModel> invitations = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      return "noInternetConnection";
    } else {
      try {
        await Supabase.instance.client
            .from("invitations")
            .select()
            .eq("fromUserEmail", HiveCRUD().user!.email)
            .inFilter("invitationStatus", [
          InvitationStatus.pending.name,
          InvitationStatus.error.name,
          InvitationStatus.canceled.name
        ]).then((value) {
          List<dynamic> list = value;
          for (int i = 0; i < list.length; i++) {
            invitations.add(InvitationModel.fromJson(list[i]));
          }
        });
      } catch (e) {
        return e.toString();
      }
    }
    return invitations;
  }

  Future<dynamic> getMyWards() async {
    List<InvitationModel> invitations = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      return "noInternetConnection";
    } else {
      try {
        await Supabase.instance.client.from("invitations").select().match({
          "fromUserEmail": HiveCRUD().user!.email,
          "invitationStatus": InvitationStatus.accepted.name
        }).then((value) {
          List<dynamic> list = value;
          for (int i = 0; i < list.length; i++) {
            invitations.add(InvitationModel.fromJson(list[i]));
          }
        });
      } catch (e) {
        return e.toString();
      }
    }
    return invitations;
  }

  Future<dynamic> getMyGuardians() async {
    List<InvitationModel> invitations = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      return "noInternetConnection";
    } else {
      try {
        await Supabase.instance.client.from("invitations").select().match({
          "toUserEmail": HiveCRUD().user!.email,
          "invitationStatus": InvitationStatus.accepted.name
        }).then((value) {
          List<dynamic> list = value;
          for (int i = 0; i < list.length; i++) {
            invitations.add(InvitationModel.fromJson(list[i]));
          }
        });
      } catch (e) {
        return e.toString();
      }
    }
    return invitations;
  }

  Future<String?> acceptInvitation(InvitationModel invitationModel) async {
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
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      await Supabase.instance.client
          .from("invitations")
          .update({"invitationStatus": InvitationStatus.accepted.name})
          .eq("id", invitationModel.id)
          .then((value) async {
            if (value.toString() == "null") {
              final crud = HiveCRUD();
              Settings?settings = crud.setting;
              if(settings!=null){
                settings = settings.copyWith(isAppShouldSentLocation: true);
                await crud.updateSettings(settings).then((value) async {
                  await Supabase.instance.client.from("ward_location").insert(
                      WardLocationModel(
                          id: invitationModel.id,
                          myEmail: invitationModel.toUserEmail,
                          myName: invitationModel.toUserName,
                          latitude: 0,
                          longitude: 0,
                          when: DateTime.now(),
                          toUserEmail: invitationModel.fromUserEmail)
                          .toJson());
                });
              }
            }
          });
    }

    return error;
  }

  Future<String?> rejectInvitation(String id) async {
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
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        await Supabase.instance.client.from("invitations").update(
            {"invitationStatus": InvitationStatus.canceled.name}).eq("id", id);
      } catch (e) {
        error = e.toString();
      }
    }

    return error;
  }

  Future<String?> removeInvitation(String id) async {
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
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        await Supabase.instance.client
            .from("invitations")
            .delete()
            .eq("id", id);
      } catch (e) {
        error = e.toString();
      }
    }

    return error;
  }

  Future<String?> deleteWard(String id) async {
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
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        await removeInvitation(id).whenComplete(() async {
          await Supabase.instance.client
              .from("ward_location")
              .delete()
              .eq("id", id);
        });
      } catch (e) {
        error = e.toString();
      }
    }

    return error;
  }

  Future<String?> checkOnValidCode(String code) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        //var url = Uri.parse('$apiUrl/medicine');
        //final cookie = await getCookie();
        //String date = medicineModel.startDate!.toUtc().toString();
        //Map<String, dynamic> map = medicineModel.toJson();
        //map["startDate"] = date;
        //await http
        //    .post(
        //  url,
        //  headers: <String, String>{
        //    'Content-Type': 'application/json',
        //    'Cookie': cookie.toString(),
        //  },
        //  body: jsonEncode(map),
        //)
        //    .then((value) async {
        //  if (!(value.statusCode > 199 && value.statusCode < 300)) {
        //    error = jsonDecode(value.body)["message"]
        //        .toString()
        //        .replaceAll("[", "")
        //        .replaceAll("]", "");
        //  } else {
        //    await await addMedicine(medicineModel).whenComplete(() async {
        //      await setIsSentInLocalMedicine(true,
        //          medicineModel: medicineModel);
        //    });
        //  }
        //});
      } catch (e) {
        error = e.toString();
      }
    }

    return error;
  }
}

//  var url = Uri.parse('$apiUrl/navaccess/for-me');
//  final cookie = await UserRepository().getCookie();
//  await http.get(
//  url,
//  headers: <String, String>{
//  'Content-Type': 'application/json',
//  'Cookie': cookie.toString(),
//  },
//  ).then((value) async {
//  if (!(value.statusCode > 199 && value.statusCode < 300)) {
//  Fluttertoast.showToast(
//  msg: jsonDecode(value.body)["message"]
//      .toString()
//      .replaceAll("[", "")
//      .replaceAll("]", ""),
//  toastLength: Toast.LENGTH_LONG);
//  } else {
//  List<dynamic> list = jsonDecode(value.body);
//
//  for (int i = 0; i < list.length; i++) {
//  invitations.add(InvitationModel.fromJson(list[i]));
//  }
//  }
//  });

//  var url = Uri.parse('$apiUrl/navaccess/from-me');
//  final cookie = await UserRepository().getCookie();
//  await http.get(
//  url,
//  headers: <String, String>{
//  'Content-Type': 'application/json',
//  'Cookie': cookie.toString(),
//  },
//  ).then((value) async {
//  if (!(value.statusCode > 199 && value.statusCode < 300)) {
//  Fluttertoast.showToast(
//  msg: jsonDecode(value.body)["message"]
//      .toString()
//      .replaceAll("[", "")
//      .replaceAll("]", ""),
//  toastLength: Toast.LENGTH_LONG);
//  } else {
//  List<dynamic> list = jsonDecode(value.body);
//
//  for (int i = 0; i < list.length; i++) {
//  invitations.add(InvitationModel.fromJson(list[i]));
//  }
//  }
//  });
//
//  var url = Uri.parse('$apiUrl/navaccess/$id/accept');
//  final cookie = await UserRepository().getCookie();
//  await http
//      .patch(
//  url,
//  headers: <String, String>{
//  'Content-Type': 'application/json',
//  'Cookie': cookie.toString(),
//  },
//  body: jsonEncode({"navaccessId": id}),
//  )
//      .then((value) async {
//  if (!(value.statusCode > 199 && value.statusCode < 300)) {
//  error = jsonDecode(value.body)["message"]
//      .toString()
//      .replaceAll("[", "")
//      .replaceAll("]", "");
//  }
//  });
//
//  var url = Uri.parse('$apiUrl/navaccess/$id/reject');
//  final cookie = await UserRepository().getCookie();
//  await http
//      .patch(
//  url,
//  headers: <String, String>{
//  'Content-Type': 'application/json',
//  'Cookie': cookie.toString(),
//  },
//  body: jsonEncode({"navaccessId": id}),
//  )
//      .then((value) async {
//  if (!(value.statusCode > 199 && value.statusCode < 300)) {
//  error = jsonDecode(value.body)["message"]
//      .toString()
//      .replaceAll("[", "")
//      .replaceAll("]", "");
//  }
//  });
//
//  var url = Uri.parse('$apiUrl/navaccess/$id');
//  final cookie = await UserRepository().getCookie();
//  await http
//      .delete(
//  url,
//  headers: <String, String>{
//  'Content-Type': 'application/json',
//  'Cookie': cookie.toString(),
//  },
//  body: jsonEncode({"navaccessId": id}),
//  )
//      .then((value) async {
//  if (!(value.statusCode > 199 && value.statusCode < 300)) {
//  error = jsonDecode(value.body)["message"]
//      .toString()
//      .replaceAll("[", "")
//      .replaceAll("]", "");
//  }
//  });
