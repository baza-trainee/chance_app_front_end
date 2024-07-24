import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sign_in_up/log_in/reset_password_enter_code.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController editingController = TextEditingController();

  FocusNode focusNode = FocusNode();
  bool isError = false;
  String errorText = "";

  @override
  void dispose() {
    //editingController.dispose();
    //focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.instance.translate("resetPassword")),
      ),
      backgroundColor: beigeBG,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "${AppLocalizations.instance.translate("enterYourEmail")}*",
                style: TextStyle(
                    fontSize: 14, color: isError ? red900 : primaryText),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: isError ? red900 : beige300),
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 16, color: isError ? red900 : primaryText),
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  validate();
                  focusNode.unfocus();
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                focusNode: focusNode,
                controller: editingController,
              ),
            ),
            if (errorText.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  errorText,
                  style: const TextStyle(fontSize: 14, color: red900),
                ),
              ),
            const Spacer(),
            const Spacer(),
            RoundedButton(
              color: primary1000,
              child: Text(
                AppLocalizations.instance.translate("confirm"),
                style: const TextStyle(
                    fontSize: 16,
                    color: primary50,
                    fontWeight: FontWeight.w500),
              ),
              onPress: () async {
                validate();
                if (!isError) {
                  await UserRepository().forgotPassword(editingController.text).then((value) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: beigeBG,
                          title: Center(
                            child: Text(
                                AppLocalizations.instance
                                    .translate("letterHasBeenSend"),
                                textAlign: TextAlign.center,
                                style:
                                    const TextStyle(color: primaryText, fontSize: 24),
                              ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "${AppLocalizations.instance.translate("checkYourMailPart1")} ${editingController.text}, ${AppLocalizations.instance.translate("checkYourMailPart2")}",
                                  style: const TextStyle(
                                      color: primaryText, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              Row(
                                children: [
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResetPasswordEnterCode(
                                                        email: editingController
                                                            .text)),
                                            (route) => true);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: primary700, fontSize: 22),
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.instance
                  .translate("weWillSentLetterOnYourEmail"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primary700,
                  fontSize: 16,
                  decorationColor: primary700),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void validate() {
    if (editingController.text.trim().isEmpty) {
      errorText = AppLocalizations.instance.translate("invalidEmailFormat");
      isError = true;
    } else {
      if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
              caseSensitive: false)
          .hasMatch(editingController.text)) {
        errorText = AppLocalizations.instance.translate("invalidEmailFormat");
        isError = true;
      } else {
        errorText = "";
        isError = false;
      }
    }

    if (mounted) setState(() {});
  }
}
