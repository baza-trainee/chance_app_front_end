import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContinueLogIn extends StatefulWidget {
  const ContinueLogIn({
    super.key,
    required this.name,
    required this.firstFocusNode,
    required this.lastFocusNode,
    required this.firstText,
    required this.secondText,
  });

  final String name;
  final TextEditingController firstText, secondText;
  final FocusNode firstFocusNode, lastFocusNode;

  @override
  State<ContinueLogIn> createState() => _ContinueLogInState();
}

class _ContinueLogInState extends State<ContinueLogIn> {
  Future<bool> onBack(RegistrationState state) async {
    bool choose = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "${AppLocalizations.instance.translate("wannaLeaveRegistration")}?",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, color: primaryText),
            ),
            content: Text(
              AppLocalizations.instance
                  .translate("whenYouCloseRegistrationDataWontBeSave"),
              textAlign: TextAlign.center,
              style: const TextStyle(color: primaryText, fontSize: 16),
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      AppLocalizations.instance.translate("continue"),
                      style: const TextStyle(fontSize: 16, color: primary500),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      AppLocalizations.instance.translate("complete"),
                      style: const TextStyle(fontSize: 16, color: primary500),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    return choose;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
      return Column(
        children: [
          RoundedButton(
              onPress: () {
                widget.firstFocusNode.unfocus();
                widget.lastFocusNode.unfocus();

                if (!state.isLoading) {
                  BlocProvider.of<RegistrationBloc>(context).add(
                      IncreaseCurrentStep(
                          context: context,
                          first: widget.firstText.text,
                          second: widget.secondText.text));
                }
              },
              color: state.isLoading ? darkNeutral1000 : primary1000,
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: primary50),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${AppLocalizations.instance.translate("alreadyHaveAccount")}?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: state.isLoading ? primary1000 : primary700),
              ),
              TextButton(
                  onPressed: () async {
                    widget.firstFocusNode.unfocus();
                    widget.lastFocusNode.unfocus();
                    await onBack(state).then((value) {
                      if (value) {
                        if (!state.isLoading) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/login", (route) => false);
                        }
                      }
                    });
                  },
                  child: Text(
                    AppLocalizations.instance.translate("enter"),
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: primary700,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: state.isLoading ? primary1000 : primary700),
                  )),
            ],
          )
        ],
      );
    });
  }
}
