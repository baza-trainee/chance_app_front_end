import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/my_wards/components/my_wards_timer.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/invitation_bloc/invitation_bloc.dart';
import 'package:chance_app/ux/model/invitation_model.dart';
import 'package:chance_app/ux/repository/invitation_repository.dart';
import 'package:chance_app/ux/repository/navigation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyWards extends StatefulWidget {
  const MyWards({super.key});

  @override
  State<MyWards> createState() => _MyWardsState();
}

class _MyWardsState extends State<MyWards> {
  @override
  void initState() {
    BlocProvider.of<InvitationBloc>(context).add(LoadMyWards());
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: MyWardsTimer(),
        ),
        Expanded(
          child: BlocBuilder<InvitationBloc, InvitationState>(
              builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: primary500,
                  radius: 50,
                ),
              );
            }
            if (state.errorMyWards == "noInternetConnection") {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off),
                  Text(
                    AppLocalizations.instance.translate("noInternetConnection"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: primaryText),
                  ),
                ],
              ));
            }
            List<InvitationModel> myWards = state.myWards;
            if (myWards.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/box_open.svg"),
                  Text(
                    AppLocalizations.instance.translate("youHaveNoWards"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: primaryText),
                  ),
                ],
              ));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: myWards.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, position) {
                InvitationModel myWard = myWards[position];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(borderRadius: BorderRadius.circular(16),
                    onTap: () async {
                      ///Todo: Отобразить месторасположение юзера
                      await NavigationRepository()
                          .getWardLocation(myWard.toUserEmail)
                          .then((value) {
                        if (value != null) {
                          isNotTapedOnMyLocationButton=true;
                          Navigator.of(context).pop();
                          mapController!.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  LatLng(value.latitude, value.longitude), 18));
                        }
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primary50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myWard.toUserName,
                                      style: const TextStyle(
                                          fontSize: 16, color: primaryText),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      myWard.toUserEmail,
                                      style: const TextStyle(
                                          fontSize: 16, color: primaryText),
                                      maxLines: 1,
                                    ),
                                  ]),
                            ),
                            IconButton(
                                onPressed: () async {
                                  if (!isLoading) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await InvitationRepository()
                                        .deleteWard(myWard.id)
                                        .then((value) {
                                      if (value == null) {
                                        BlocProvider.of<InvitationBloc>(context)
                                            .add(LoadInvitationsForMe());
                                      } else {
                                        Fluttertoast.showToast(msg: value);
                                      }
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: red800,
                                )),
                          ],
                        )),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
