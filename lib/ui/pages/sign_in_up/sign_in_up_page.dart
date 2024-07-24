import 'package:chance_app/ui/components/logo_name.dart';
import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInUpPage extends StatefulWidget {
  const SignInUpPage({super.key});

  @override
  State<SignInUpPage> createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IgnorePointer(
        ignoring: isLoading,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoName(),
                const SizedBox(
                  height: 40,
                ),
                RoundedButton(
                    onPress: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/registration", (route) => true);
                    },
                    color: primary1000,
                    child: Text(
                      AppLocalizations.instance.translate("createAccount"),
                      style: const TextStyle(
                          color: primary50,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/login", (route) => true);
                    },
                    child: Text(
                      AppLocalizations.instance.translate("enter"),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: primary700,
                          color: primary700,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 40,
                ),
                RoundedButton(
                    onPress: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await UserRepository()
                          .getIdTokenFromAuthCode()
                          .then((value) {
                        if (!value) {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil("/main_page", (route) => false);
                        }
                      }).whenComplete(() {
                        isLoading = false;
                        if (mounted) setState(() {});
                      });
                    },
                    color: Colors.transparent,
                    border: Border.all(color: primary1000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.instance.translate("enterWith"),
                          style: const TextStyle(
                              color: primary1000,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/google.svg",
                          color: primary1000,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 16,
                ),
                //RoundedButton(
                //    color: Colors.transparent,
                //    border: Border.all(color: primary1000),
                //    child: Row(
                //      mainAxisAlignment: MainAxisAlignment.center,
                //      children: [
                //        Text(
                //          AppLocalizations.instance.translate("enterWith"),
                //          style: const TextStyle(
                //              color: primary1000,
                //              fontSize: 16,
                //              fontWeight: FontWeight.w500),
                //        ),
                //        const SizedBox(
                //          width: 10,
                //        ),
                //        SvgPicture.asset(
                //          "assets/icons/apple.svg",
                //          color: primary1000,
                //        ),
                //      ],
                //    )),
                const SizedBox(
                  height: 16,
                ),
                //RoundedButton(
                //    color: Colors.transparent,
                //    border: Border.all(color: primary1000),
                //    child: Row(
                //      mainAxisAlignment: MainAxisAlignment.center,
                //      children: [
                //        Text(
                //          AppLocalizations.instance.translate("enterWith"),
                //          style: const TextStyle(
                //              color: primary1000,
                //              fontSize: 16,
                //              fontWeight: FontWeight.w500),
                //        ),
                //        const SizedBox(
                //          width: 10,
                //        ),
                //        SvgPicture.asset(
                //          "assets/icons/facebook.svg",
                //          color: primary1000,
                //        ),
                //      ],
                //    )),
              ],
            ),
          ),
        ),
      ),
      if (isLoading)
        Container(
          color: Colors.black26,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CupertinoActivityIndicator(
              color: primary500,
              radius: 50,
            ),
          ),
        )
    ]);
  }
}
