import 'dart:io';
import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupDetailsScreen extends StatelessWidget {
  final SosGroupModel group;

  const GroupDetailsScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          group.name,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
          itemCount: group.contacts.length,
          itemBuilder: (context, index) {
            final contact = group.contacts[index];
            return ContainerButton(
              contactName: contact.name,
              contactPhone: contact.phone,
              onPressed: () {},
              contacts: const [],
            );
          },
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String contactName;
  final String contactPhone;
  final List<SosContactModel> contacts;
  final VoidCallback onPressed;

  const ContainerButton({
    super.key,
    required this.contactName,
    required this.contacts,
    required this.onPressed,
    required this.contactPhone,
  });

  Future<void> _makePhoneCall(BuildContext context) async {
    if (Platform.isAndroid) {
      final callPermissionStatus = await Permission.phone.status;
      if (callPermissionStatus.isDenied) {
        final permissionStatus = await Permission.phone.request();
        if (permissionStatus.isGranted) {
          final String userPhone = contactPhone;
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
        final String userPhone = contactPhone;
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
      final String userPhone = contactPhone;
      try {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: userPhone,
        );
        await launchUrl(launchUri);
        if (!await launchUrl(launchUri)) {
          Fluttertoast.showToast(
            msg: AppLocalizations.instance.translate("failedToCallTheNumber") +
                (" $contactPhone"),
          );
        }
      } on PlatformException catch (e) {
        Fluttertoast.showToast(
          msg: AppLocalizations.instance.translate("failedToCallTheNumber") +
              (" $contactPhone, ${e.message}"),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: darkNeutral600,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            contactName,
            style: const TextStyle(
              color: primary50,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        onTap: () async => await _makePhoneCall(context),
      ),
    );
  }
}
