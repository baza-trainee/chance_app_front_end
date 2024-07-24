
import 'dart:async';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/invitation_bloc/invitation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyGuardiansTimer extends StatefulWidget {
  const MyGuardiansTimer({super.key});

  @override
  State<MyGuardiansTimer> createState() => _MyGuardiansTimerState();
}

class _MyGuardiansTimerState extends State<MyGuardiansTimer> {
  late Timer timer;
  int secondsLeft = 15;

  @override
  void initState() {
    loadTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (!(secondsLeft > 0)) {
              loadTimer();
              BlocProvider.of<InvitationBloc>(context)
                  .add(LoadMyGuardians());
            }
          },
          child: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                "${AppLocalizations.instance.translate("update")}${secondsLeft != 0 ? " ${AppLocalizations.instance.translate("through").toLowerCase()} $secondsLeft" : ""}",
                style: TextStyle(
                    fontSize: 20,
                    color: secondsLeft != 0 ? darkNeutral600 : primary700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadTimer() async {
    secondsLeft = 15;
    if (mounted) setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsLeft--;
      if (secondsLeft < 1) {
        timer.cancel();
      }
      if (mounted) setState(() {});
    });
  }
}
