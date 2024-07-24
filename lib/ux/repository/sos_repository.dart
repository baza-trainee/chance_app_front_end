import 'dart:convert';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class SosRepository {
  get convert => null;
  final Box<SosGroupModel> _storageGroups = groupBox;

  List<SosGroupModel> getLocalGroups() {
    return _storageGroups.values.toList();
  }

  Future<List<SosGroupModel>?> loadContacts() async {
    List<SosGroupModel> contacts = [];
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: AppLocalizations.instance.translate("noInternetConnection"),
        toastLength: Toast.LENGTH_LONG,
      );

      return HiveCRUD().myGroupContacts;
    }

    final cookie = await UserRepository().getCookie();
    var url = Uri.parse('$apiUrl/sos');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        },
      );

      if (response.statusCode > 199 && response.statusCode < 300) {
        String bodyString = response.body;
        Map<String, dynamic> data = json.decode(bodyString);
        List<dynamic> contactList = data['contacts'];
        List<dynamic> groupsList = data['groups'];

        if (contactList.isNotEmpty) {
          for (var contactItem in contactList) {
            String groupNameToAdd = '';
            String groupIdToAdd = "";

            if (groupsList.isNotEmpty) {
              for (var groupItem in groupsList) {
                if (groupItem["_id"] == contactItem["group"]) {
                  groupNameToAdd = groupItem["name"];
                }
              }
            }

            if (groupsList.isNotEmpty) {
              for (var groupItem in groupsList) {
                if (groupItem["_id"] == contactItem["group"]) {
                  groupIdToAdd = groupItem["_id"];
                }
              }
            }

            List<SosContactModel> contactsToModel = [];
            List<dynamic> sosContacts = contactItem["contacts"];
            String sosContactsId = contactItem["_id"];
            if (sosContacts.isNotEmpty) {
              for (var sosContact in sosContacts) {
                String contactName = sosContact["name"];
                String contactPhone = sosContact["phone"];
                String contactId = sosContact["_id"];
                String contactsId = sosContactsId;

                contactsToModel.add(SosContactModel(
                  name: contactName,
                  phone: contactPhone,
                  id: contactId,
                  contactsId: contactsId,
                ));
              }
            }

            contacts.add(
              SosGroupModel(
                id: groupNameToAdd.isNotEmpty
                    ? groupIdToAdd
                    : contactItem["_id"],
                contacts: contactsToModel,
                name: groupNameToAdd,
              ),
            );
          }
          await HiveCRUD().loadGroups(contacts);
        } else {
          Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("failedToGetContactList"),
            toastLength: Toast.LENGTH_LONG,
          );
        }
      } else {
        String error = jsonDecode(response.body)["message"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "");
        Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return contacts;
  }

  Future<SosGroupModel?> saveContact(SosGroupModel contactModel,
      {String? groupId}) async {
    String? error;
    SosGroupModel? groupModel;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
    }

    try {
      var url = Uri.parse('$apiUrl/sos');
      final cookie = await UserRepository().getCookie();

      List<Map<String, String>> contactsData = contactModel.contacts
          .map((e) => {
                "name": e.name,
                "phone": e.phone,
              })
          .toList();

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        },
        body: jsonEncode({
          "group": groupId ?? "",
          "contacts": contactsData,
        }),
      );

      if (response.statusCode > 199 && response.statusCode < 300) {
        String bodyString = response.body;
        Map<String, dynamic> data = json.decode(bodyString);
        List<dynamic> contactList = data['contacts'];

        if (contactList.isNotEmpty) {
          for (int i = 0; i < contactList.length; i++) {
            Map<String, dynamic> groupData = contactList[i];
            String contactName = groupData["name"];
            String contactPhone = groupData["phone"];
            String contactId = groupData["_id"];
            groupModel = SosGroupModel(name: "", contacts: [
              SosContactModel(
                  name: contactName,
                  phone: contactPhone,
                  id: contactId,
                  groupName: "group_name_here")
            ]);
          }
        }
      } else {
        error = jsonDecode(response.body)["message"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "");
      }
    } catch (e) {
      error = e.toString();
    }

    if (error != null) {
      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
    }

    return groupModel;
  }

  Future<SosContactModel?> editContact(
      SosGroupModel group, SosContactModel contactModel) async {
    String? error;
    SosContactModel? groupModel;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
    }

    try {
      var url = Uri.parse('$apiUrl/sos/${contactModel.id}');
      final cookie = await UserRepository().getCookie();
      var response = await http.patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        },
        body: jsonEncode({
          "group": "",
          "contacts": [
            {"name": contactModel.name, "phone": contactModel.phone}
          ]
        }),
      );

      if (!(response.statusCode > 199 && response.statusCode < 300)) {
        error = jsonDecode(response.body)["message"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "");
      }
    } catch (e) {
      error = e.toString();
    }

    if (error != null) {
      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
    }

    return groupModel;
  }

  Future<SosContactModel?> editContacts(
      SosGroupModel group, SosContactModel contactModel) async {
    String? error;
    SosContactModel? groupModel;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
    }
    try {
      var url = Uri.parse('$apiUrl/sos/${group.contacts[0].contactsId}');
      final cookie = await UserRepository().getCookie();

      List<Map<String, String>> contactsData = group.contacts
          .map((e) => {
                "name": e.name,
                "phone": e.phone,
              })
          .toList();

      var response = await http.patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        },
        body: jsonEncode({"group": group.id, "contacts": contactsData}),
      );

      if (!(response.statusCode > 199 && response.statusCode < 300)) {
        error = jsonDecode(response.body)["message"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "");
      }
    } catch (e) {
      error = e.toString();
    }

    if (error != null) {
      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
    }

    return groupModel;
  }

  Future<SosContactModel?> editGroup(SosGroupModel contactModel) async {
    String? error;
    SosContactModel? groupModel;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
    }

    try {
      var url = Uri.parse('$apiUrl/sos/group/${contactModel.id}');
      final cookie = await UserRepository().getCookie();

      var response = await http.patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        },
        body: jsonEncode({"name": contactModel.name}),
      );
      if (!(response.statusCode > 199 && response.statusCode < 300)) {
        error = jsonDecode(response.body)["message"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "");
      }
    } catch (e) {
      error = e.toString();
    }
    if (error != null) {
      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
    }

    return groupModel;
  }

  Future<String?> removeContact(String contactId) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
    } else {
      try {
        var url = Uri.parse('$apiUrl/sos/$contactId');
        final cookie = await UserRepository().getCookie();
        await http.delete(url, headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        }).then((value) {
          if (!(value.statusCode > 199 && value.statusCode < 300)) {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          } else {}
        });
      } catch (error) {
        Fluttertoast.showToast(
            msg: error.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return error;
  }

  Future<String?> removeGroup(String groupId) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/sos/group/$groupId');
        final cookie = await UserRepository().getCookie();
        await http.delete(url, headers: <String, String>{
          'Content-Type': 'application/json',
          'Cookie': cookie.toString(),
        }).then((value) {
          if (!(value.statusCode > 199 && value.statusCode < 300)) {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          }
        });
      } catch (error) {
        Fluttertoast.showToast(
            msg: error.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return error;
  }

  Future<String?> addGroupName({
    required String name,
  }) async {
    String? error;
    String? groupId;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("noInternetConnection"),
          toastLength: Toast.LENGTH_LONG);
      error = AppLocalizations.instance.translate("noInternetConnection");
    } else {
      try {
        var url = Uri.parse('$apiUrl/sos/group');
        final cookie = await UserRepository().getCookie();
        await http
            .post(url,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                  'Cookie': cookie.toString(),
                },
                body: jsonEncode({
                  "name": name,
                }))
            .then((value) async {
          if (!(value.statusCode > 199 && value.statusCode < 300)) {
            error = jsonDecode(value.body)["message"]
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "");
            Fluttertoast.showToast(msg: error!, toastLength: Toast.LENGTH_LONG);
          } else {
            String bodyString = value.body;
            Map<String, dynamic> data = json.decode(bodyString);
            groupId = data["_id"];
          }
        });
      } catch (error) {
        Fluttertoast.showToast(
            msg: error.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return groupId;
  }
}
