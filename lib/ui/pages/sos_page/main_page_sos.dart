import 'dart:io';

import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sos_page/group_details_screen.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageSos extends StatefulWidget {
  const MainPageSos({super.key});

  @override
  State<MainPageSos> createState() => _MainPageSosState();
}

class _MainPageSosState extends State<MainPageSos> {
  bool isDeletePage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil("/main_page", (route) => false),
        ),
        title: Text(
          AppLocalizations.instance.translate("emergencyCall"),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            // fontFamily: ,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            color: darkNeutral800,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'replace',
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: darkNeutral300),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.instance.translate("editContacts"),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: darkNeutral300),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: darkNeutral300),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.instance.translate("deleteContact"),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: darkNeutral300),
                    ),
                  ),
                ),
              ];
            },
            onSelected: (String value) {
              Navigator.pushNamed(context, "/delete_edit_contact_sos",
                  arguments: value == 'replace' ? false : true);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContainerButton(
                text:
                    AppLocalizations.instance.translate("emergencyService112"),
                onPressed: () => _makePhoneCall(
                  SosContactModel(
                    name: AppLocalizations.instance
                        .translate("emergencyService112"),
                    phone: "112",
                  ),
                ),
              ),
              BlocSelector<SosContactsBloc, SosContactsState,
                  List<SosGroupModel>>(
                selector: (state) => state.contacts,
                builder: (context, contacts) => ListView.builder(
                  itemCount: contacts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 29),
                  itemBuilder: (context, index) {
                    SosGroupModel contactModel = contacts[index];
                    return ContainerButton(
                      text: contactModel.name.isNotEmpty
                          ? contactModel.name
                          : contactModel.contacts[0].name,
                      onPressed: () {
                        if (contactModel.name.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GroupDetailsScreen(group: contactModel),
                            ),
                          );
                        } else {
                          _makePhoneCall(
                            SosContactModel(
                              name: contactModel.contacts[0].name,
                              phone: contactModel.contacts[0].phone,
                            ),
                          );
                        }
                      },
                      isGroup: contactModel.name.isNotEmpty,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 44,
        width: 113,
        margin: const EdgeInsets.only(bottom: 210, right: 5),
        child: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          icon: const Icon(
            Icons.add,
            color: primary50,
          ),
          label: Text(
            AppLocalizations.instance.translate("add"),
            style: const TextStyle(
              color: primary50,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: primary1000,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: beigeBG,
        builder: (BuildContext context) {
          return BottomSheet(
            backgroundColor: beige100,
            enableDrag: false,
            onClosing: () {},
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 4,
                      width: 32,
                      decoration: const BoxDecoration(color: beige400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        // left: 10.0,
                        // right: 10.0,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 164,
                              height: 56,
                              decoration: BoxDecoration(
                                color: darkNeutral600,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/add_contact');
                                },
                                child: Text(
                                  AppLocalizations.instance
                                      .translate("contact"),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: primary50,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 164,
                              height: 56,
                              decoration: BoxDecoration(
                                color: darkNeutral600,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/add_group');
                                },
                                child: Text(
                                  AppLocalizations.instance.translate("group"),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: primary50,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Future<void> _makePhoneCall(SosContactModel contactModel) async {
    if (Platform.isAndroid) {
      final callPermissionStatus = await Permission.phone.status;
      if (callPermissionStatus.isDenied) {
        final permissionStatus = await Permission.phone.request();
        if (permissionStatus.isGranted) {
          final String userPhone = contactModel.phone;
          try {
            const MethodChannel('caller').invokeMethod('makeCall', userPhone);
          } on PlatformException catch (e) {
            Fluttertoast.showToast(
              msg:
                  AppLocalizations.instance.translate("failedToCallTheNumber") +
                      ("$userPhone, ${e.message}"),
            );
          }
        } else {
          Fluttertoast.showToast(
              msg: AppLocalizations.instance
                  .translate("givePermissionToMakeCalls"));
        }
      } else if (callPermissionStatus.isGranted) {
        final String userPhone = contactModel.phone;
        try {
          const MethodChannel('caller').invokeMethod('makeCall', userPhone);
        } on PlatformException catch (e) {
          Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("failedToCallTheNumber") +
                ("$userPhone, ${e.message}"),
          );
        }
      } else if (callPermissionStatus.isPermanentlyDenied) {
        showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.instance.translate('attention')),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(AppLocalizations.instance
                        .translate('permissionToMakeCalls')),
                  ],
                ),
              ),
              actions: <Widget>[
                RoundedButton(
                  color: Colors.transparent,
                  border: Border.all(
                    color: darkNeutral800,
                  ),
                  tapColor: primary100,
                  child: Text(
                    AppLocalizations.instance.translate('toSettings'),
                    style: const TextStyle(
                      fontSize: 18,
                      height: 24 / 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: darkNeutral800,
                    ),
                  ),
                  onPress: () {
                    Navigator.of(context).pop();
                    openAppSettings();
                  },
                ),
              ],
            );
          },
        );
      }
    } else if (Platform.isIOS) {
      final String userPhone = contactModel.phone;
      try {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: userPhone,
        );
        await launchUrl(launchUri);
        if (!await launchUrl(launchUri)) {
          Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("failedToCallTheNumber") +
                (" $userPhone"),
          );
        }
      } on PlatformException catch (e) {
        Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("failedToCallTheNumber") +
              (" $contactModel.phone, ${e.message}"),
        );
      }
    }
  }
}

class ContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGroup;

  const ContainerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: darkNeutral600,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: primary50,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            if (isGroup)
              const Icon(
                Icons.group,
                color: primary50,
              ),
          ],
        ),
      ),
    );
  }
}
