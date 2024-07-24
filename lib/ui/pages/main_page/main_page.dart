import 'dart:async';
import 'dart:io';

import 'package:chance_app/ui/components/custom_card.dart';
import 'package:chance_app/ui/components/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:chance_app/ui/components/logo_name.dart';
import 'package:chance_app/ui/components/sos_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = false;
  bool dontShowDialogAgain = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = (size.width / 2) - 32;

    return Stack(children: [
      IgnorePointer(
        ignoring: isLoading,
        child: Scaffold(
            backgroundColor: beigeBG,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const SosButton(),
            bottomNavigationBar: const CustomNavigationBar(),
            body: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  const LogoName(),
                  const Spacer(),
                  Row(
                    children: [
                      CustomCard(
                        key: const ValueKey("reminder_page"),
                        icon: Image.asset(
                          "assets/menu_icons/reminders.png",
                          height: 44,
                          width: 44,
                        ),
                        text: Text(
                          AppLocalizations.instance.translate("reminder"),
                          style: const TextStyle(color: primaryText),
                          textAlign: TextAlign.center,
                        ),
                        width: cardWidth,
                        margin:
                            const EdgeInsets.only(bottom: 8, top: 8, right: 8),
                        onPress: () async {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/reminders", (route) => true);
                        },
                      ),
                      CustomCard(
                        key: const ValueKey("navigation_page"),
                        icon: Image.asset(
                          "assets/menu_icons/navigation.png",
                          height: 45,
                          width: 45,
                        ),
                        text: Text(
                          AppLocalizations.instance.translate("navigation"),
                          style: const TextStyle(color: primaryText),
                          textAlign: TextAlign.center,
                        ),
                        width: cardWidth,
                        margin:
                            const EdgeInsets.only(bottom: 8, top: 8, left: 8),
                        onPress: () async {
                          setState(() {
                            isLoading = true;
                          });
                          bool? choose = HiveCRUD.instance.setting
                              ?.dontShowInformationDialogBeforeOpenMap;
                          print("choose $choose");
                          if (choose==null||choose==false) {
                            choose = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Chance App"),
                                    content: StatefulBuilder(
                                        builder: (context, setState1) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            AppLocalizations.instance.translate(
                                                "allowTheAppToUseGeodataToDetermineYourCurrentLocation"),
                                            textAlign: TextAlign.justify,
                                          ),
                                          CheckboxListTile(
                                              title: Text(AppLocalizations
                                                  .instance
                                                  .translate("dontShowAgain")),
                                              value: dontShowDialogAgain,
                                              onChanged: (value) async {
                                                if (value != null) {
                                                  setState1(() {
                                                    dontShowDialogAgain = value;
                                                  });
                                                  Settings? settings =
                                                      HiveCRUD().setting;
                                                  if (settings != null) {
                                                    await HiveCRUD().updateSettings(
                                                        settings.copyWith(
                                                            dontShowInformationDialogBeforeOpenMap:
                                                                value));
                                                  }
                                                }
                                              }),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: Text(AppLocalizations
                                                    .instance
                                                    .translate("cancel")),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(true),
                                                child: Text(AppLocalizations
                                                    .instance
                                                    .translate("toAgree")),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                });
                          }
                          if (choose != null && choose) {
                            await checkLocationPermission(context)
                                .then((value) {
                              if (value) {
                                Navigator.of(context)
                                    .pushNamed("/navigation_page");
                              }
                            });
                          }
                          isLoading = false;
                          if (mounted) setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomCard(
                        key: const ValueKey("communication_page"),
                        icon: Image.asset(
                          "assets/menu_icons/chat.png",
                          height: 44,
                          width: 44,
                        ),
                        text: Text(
                          AppLocalizations.instance.translate("communication"),
                          style: const TextStyle(color: primaryText),
                          textAlign: TextAlign.center,
                        ),
                        width: cardWidth,
                        margin:
                            const EdgeInsets.only(bottom: 8, top: 8, right: 8),
                        onPress: () => _onChatsBtnTap(context),
                      ),
                      CustomCard(
                        key: const ValueKey("appointmentWithDoctor_page"),
                        icon: Image.asset(
                          "assets/menu_icons/appointment.png",
                          height: 44,
                          width: 44,
                        ),
                        text: Text(
                          AppLocalizations.instance
                              .translate("appointmentWithDoctor"),
                          style: const TextStyle(color: primaryText),
                          textAlign: TextAlign.center,
                        ),
                        width: cardWidth,
                        margin:
                            const EdgeInsets.only(bottom: 8, top: 8, left: 8),
                        onPress: () {
                          Navigator.of(context)
                              .pushNamed("/doctor_appointment");
                        },
                      ),
                    ],
                  ),
                  CustomCard(
                    key: const ValueKey("jobSearch_page"),
                    icon: Image.asset(
                      "assets/menu_icons/job_search.png",
                      height: 44,
                      width: 44,
                    ),
                    text: Text(
                      AppLocalizations.instance.translate("jobSearch"),
                      style: const TextStyle(color: primaryText),
                      textAlign: TextAlign.center,
                    ),
                    width: cardWidth,
                    margin: const EdgeInsets.only(bottom: 8, top: 8),
                    onPress: () {
                      Navigator.of(context).pushNamed("/job_search");
                    },
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            )),
      ),
      if (isLoading)
        Container(
          height: size.height,
          width: size.width,
          color: Colors.black26,
          child: const Center(
            child: CupertinoActivityIndicator(
              color: primary500,
              radius: 50,
            ),
          ),
        )
    ]);
  }

  Future<bool> checkLocationPermission(BuildContext context) async {
    bool isOkay = false;
    await Permission.location.request().then((status) async {
      if (status != PermissionStatus.denied &&
          status != PermissionStatus.permanentlyDenied) {
        isOkay = true;
      }
      if (!isOkay) {
        if (mounted) {
          await showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    AppLocalizations.instance
                        .translate("allowTheAppToUseTheLocation"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, color: primaryText),
                  ),
                  content: Text(
                    AppLocalizations.instance.translate(
                        "forTheAppToWorkCorrectlyYouNeedToAllowThisPermissionToBeUsed"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: primaryText),
                  ),
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child:
                          Text(AppLocalizations.instance.translate("cancel")),
                    ),
                    TextButton(
                      onPressed: () async {
                        await Geolocator.openLocationSettings().then((value) {
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(AppLocalizations.instance.translate("goTo")),
                    ),
                  ],
                );
              }).then((value) {
            if (value == null) {
              checkLocationPermission(context);
            }
          });
        }
      }
    });
    if (Platform.isAndroid) {}

    return isOkay;
  }

  void _onChatsBtnTap(BuildContext context) =>
      Navigator.of(context).pushNamed('/chats');
}
