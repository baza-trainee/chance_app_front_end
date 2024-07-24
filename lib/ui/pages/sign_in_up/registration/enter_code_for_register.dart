import 'dart:async';

import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/registration_bloc/registration_bloc.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeForRegister extends StatefulWidget {
  const EnterCodeForRegister({super.key});

  @override
  State<EnterCodeForRegister> createState() => _EnterCodeForRegisterState();
}

class _EnterCodeForRegisterState extends State<EnterCodeForRegister> {
  TextEditingController textEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();
  int secondsLeft = 60;
  late Timer timer;
  bool isTaped = false;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsLeft--;
      if (secondsLeft < 1) {
        timer.cancel();
      } else {
        if (mounted) setState(() {});
      }
    });
    loadTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.instance.translate("registration")),
        ),
        backgroundColor: beigeBG,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Text(
                  AppLocalizations.instance
                      .translate("weHaveSentLetterOnYourEmail"),
                  style: const TextStyle(fontSize: 16, letterSpacing: 0.5),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PinCodeTextField(
                  focusNode: focusNode,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: size.width / 6,
                    fieldWidth: size.width / 6,
                    activeFillColor: primary800,
                    selectedColor: primary800,
                    inactiveColor: primary800,
                    disabledColor: primary800,
                  ),
                  cursorColor: primary800,
                  controller: textEditingController,
                  appContext: context,
                  length: 4,
                  onSaved: (value) async {
                    isTaped = true;
                    String code = textEditingController.text;
                    if (code.length == 4) {
                      await UserRepository()
                          .checkIsCodeValid(
                              code, state.email, state.passwordFirst)
                          .then((value) {
                        if (value == null) {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil("/main_page", (route) => false);
                          BlocProvider.of<RegistrationBloc>(context)
                              .add(ClearData());
                        }
                      });
                    }
                    isTaped = false;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  AppLocalizations.instance.translate("enterCode"),
                  style: const TextStyle(color: primaryText, fontSize: 14),
                ),
              ),
              const Spacer(),
              const Spacer(),
              RoundedButton(
                  onPress: () async {
                    isTaped = true;
                    if(isTaped){
                      String code = textEditingController.text;
                      if (code.length == 4) {
                        await UserRepository()
                            .checkIsCodeValid(textEditingController.text,
                            state.email, state.passwordFirst)
                            .then((value) {
                          if (value == null) {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil("/main_page", (route) => false);
                            BlocProvider.of<RegistrationBloc>(context)
                                .add(ClearData());
                          }
                        });
                      }

                    }
                    isTaped = false;

                    //BlocProvider.of<RegistrationBloc>(context)
                    //    .add(IncreaseCurrentStep(context));
                  },
                  color: primary1000,
                  child: Text(
                    AppLocalizations.instance.translate("complete"),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primary50),
                  )),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40,
                      child: Text(
                        "${AppLocalizations.instance.translate("didntReceive")}?   ${secondsLeft > 0 ? "${AppLocalizations.instance.translate("resend")}: $secondsLeft${AppLocalizations.instance.translate("sec")}." : ""}",
                        style: const TextStyle(color: primaryText, fontSize: 14),
                      )),
                  SizedBox(
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          isTaped = true;
                          if (!(secondsLeft > 0)) {
                            UserRepository().resendCode(state.email);
                            //Repository().resendCode(textEditingController.text);
                            loadTimer();
                          }
                          isTaped = false;
                        },
                        child: Text(
                          secondsLeft > 0
                              ? ""
                              : AppLocalizations.instance
                                  .translate("resendAgain"),
                          style: TextStyle(
                              color: secondsLeft > 0 ? primaryText : primary500,
                              fontSize: 16),
                        ),
                      )),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }

  loadTimer() async {
    secondsLeft = 60;
  }
}
