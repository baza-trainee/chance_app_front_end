import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/invitations/check_my_invitation/components/invitation_for_me_timer.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/invitation_bloc/invitation_bloc.dart';
import 'package:chance_app/ux/enum/invitation_status.dart';
import 'package:chance_app/ux/model/invitation_model.dart';
import 'package:chance_app/ux/repository/invitation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InvitationForMe extends StatefulWidget {
  const InvitationForMe({super.key});

  @override
  State<InvitationForMe> createState() => _InvitationForMeState();
}

class _InvitationForMeState extends State<InvitationForMe> {
  bool isLoading = false;

  @override
  void initState() {
    BlocProvider.of<InvitationBloc>(context).add(LoadInvitationsForMe());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: InvitationForMeTimer(),
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
                if (state.errorInvitationsForMe == "noInternetConnection") {
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
                List<InvitationModel> invitationsForMe = state.invitationsForMe;
                if (invitationsForMe.isEmpty) {
                  return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/box_open.svg"),
                          Text(
                            AppLocalizations.instance.translate("youHaveNoInvitations"),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: primaryText),
                          ),
                        ],
                      ));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: invitationsForMe.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, position) {
                    InvitationModel invitationForMe = invitationsForMe[position];
                    return Container(
                        margin: const EdgeInsets.only(bottom: 10),
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
                                  invitationForMe.fromUserName,
                                  style: const TextStyle(
                                      fontSize: 16, color: primaryText),
                                  maxLines: 1,
                                ),
                                Text(
                                  invitationForMe.fromUserEmail,
                                  style: const TextStyle(
                                      fontSize: 16, color: primaryText),
                                  maxLines: 1,
                                ),
                                Text(
                                  invitationForMe.invitationStatus
                                      .toLocalizedString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: invitationForMe.invitationStatus ==
                                              InvitationStatus.pending
                                              ? darkNeutral600
                                              : invitationForMe.invitationStatus ==
                                              InvitationStatus.accepted
                                              ? green
                                              : red800),
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
                                    .acceptInvitation(invitationForMe)
                                    .then((value) {
                                  if (value == null) {
                                    BlocProvider.of<InvitationBloc>(context)
                                        .add(LoadInvitationsForMe());
                                  } else {
                                    Fluttertoast.showToast(msg: value);
                                  }
                                  isLoading = false;
                                  if (mounted) setState(() {});
                                });
                              }
                            },
                                icon: const Icon(
                                  Icons.done,
                                  color: green,
                                )),
                            IconButton(
                                onPressed: () async {
                              if (!isLoading) {
                                setState(() {
                                  isLoading = true;
                                });
                                await InvitationRepository()
                                    .rejectInvitation(invitationForMe.id)
                                    .then((value) {
                                  if (value == null) {
                                    BlocProvider.of<InvitationBloc>(context)
                                        .add(LoadInvitationsForMe());
                                  } else {
                                    Fluttertoast.showToast(msg: value);
                                  }
                                  isLoading = false;
                                  if (mounted) setState(() {});
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.close,
                              color: red800,
                            )),
                      ],
                    ));
              },
            );
          }),
        ),
      ],
    );
  }
}
