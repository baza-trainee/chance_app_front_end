import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:flutter/material.dart';

class ResetPasswordEnterNewPassword extends StatefulWidget {
  const ResetPasswordEnterNewPassword(
      {super.key, required this.email, required this.code});

  final String email, code;

  @override
  State<ResetPasswordEnterNewPassword> createState() =>
      _ResetPasswordEnterNewPasswordState();
}

class _ResetPasswordEnterNewPasswordState
    extends State<ResetPasswordEnterNewPassword> {
  TextEditingController firstPassword = TextEditingController(),
      secondPassword = TextEditingController();
  FocusNode firstFocusNode = FocusNode(),
      secondFocusNode = FocusNode();
  String errorTextFirst = "",
      errorTextSecond = "";
  bool isErrorFirst = false,
      isErrorSecond = false;
  bool obscureTextFirst = true,
      obscureTextSecond = true;
//@override
//  void dispose() {
//    firstPassword.dispose();
//    secondPassword.dispose();
//    firstFocusNode.dispose();
//    secondFocusNode.dispose();
//    super.dispose();
//  }

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
                AppLocalizations.instance.translate("enterNewCode"),
                style: TextStyle(
                    fontSize: 14, color: isErrorFirst ? red900 : primaryText),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: isErrorFirst ? red900 : beige300),
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 16, color: isErrorFirst ? red900 : primaryText),
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  validate();
                },
                obscureText: obscureTextFirst,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextFirst = !obscureTextFirst;
                      });
                    },
                    icon: Icon(obscureTextFirst
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,color: beige500),
                  ),
                ),
                focusNode: firstFocusNode,
                controller: firstPassword,
              ),
            ),
            if (errorTextFirst
                .trim()
                .isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  errorTextFirst,
                  style: const TextStyle(fontSize: 14, color: red900),
                ),
              ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                AppLocalizations.instance.translate("enterNewCodeAgain"),
                style: TextStyle(
                    fontSize: 14, color: isErrorSecond ? red900 : primaryText),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: isErrorSecond ? red900 : beige300),
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 16, color: isErrorSecond ? red900 : primaryText),
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  validate();
                },
                obscureText: obscureTextSecond,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextSecond = !obscureTextSecond;
                      });
                    },
                    icon: Icon(obscureTextSecond
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,color: beige500),
                  ),
                ),
                focusNode: secondFocusNode,
                controller: secondPassword,
              ),
            ),
            if (errorTextSecond
                .trim()
                .isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  errorTextSecond,
                  style: const TextStyle(fontSize: 14, color: red900),
                ),
              ),
            const Spacer(),
            RoundedButton(
                onPress: () async {
                  validate();
                  if (!isErrorFirst && !isErrorSecond) {
                    await UserRepository()
                        .resetPassword(
                            widget.email, widget.code, firstPassword.text)
                        .then((value) {
                          if(value==null) {
                            Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                          }else{
                            errorTextFirst = value;
                            isErrorFirst = true;
                            errorTextSecond = value;
                            isErrorSecond = false;
                          }
                    });
                  }
                },
                color: primary1000,
                child: Text(
                  AppLocalizations.instance.translate("save"),
                  style: const TextStyle(fontSize: 16, color: primary50),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void validate() {
    if (firstPassword.text.trim().length < 8) {
      errorTextFirst =
          AppLocalizations.instance.translate("passwordLengthMustBeMoreThan");
      isErrorFirst = true;
    } else {
      errorTextFirst = '';
      isErrorFirst = false;
    }
    if (firstPassword.text.trim().length > 14) {
      errorTextFirst =
          AppLocalizations.instance.translate("passwordLengthMustBeLessThan");
      isErrorFirst = true;
    } else {
      errorTextFirst = '';
      isErrorFirst = false;
    }

    if (secondPassword.text.trim().length < 8) {
      errorTextSecond =
          AppLocalizations.instance.translate("passwordLengthMustBeMoreThan");
      isErrorSecond = true;
    } else {
      errorTextFirst = '';
      isErrorSecond = false;
    }
    if (secondPassword.text.trim().length > 14) {
      errorTextSecond =
          AppLocalizations.instance.translate("passwordLengthMustBeLessThan");
      isErrorSecond = true;
    } else {
      errorTextSecond = '';
      isErrorSecond = false;
    }
    if (!isErrorFirst) {
      if (!isErrorSecond) {
        if (firstPassword.text != secondPassword.text) {
          errorTextSecond =
              AppLocalizations.instance.translate("passwordsAreNotSame");
        }
      }
    }

    if (mounted) setState(() {});
  }
}
