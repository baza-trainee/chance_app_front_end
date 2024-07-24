import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sign_in_up/log_in/input_login_layout.dart';
import 'package:chance_app/ux/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode();

  final TextEditingController emailTextEditingController =
          TextEditingController(),
      passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordTextEditingController.dispose();
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.instance.translate("signIn")),
            leading: BackButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/signinup", (route) => false);
              },
            )),
        resizeToAvoidBottomInset: false,
        backgroundColor: beigeBG,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              InputLoginLayout(
                title:
                    "${AppLocalizations.instance.translate("enterYourEmail")}*",
                focusNode: emailFocusNode,
                obscureText: false,
                textInputAction: TextInputAction.next,
                inputLoginLayouts: InputLoginLayouts.email,
                focusOtherField: () {
                  emailFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                textInputType: TextInputType.emailAddress,
                textEditingController: emailTextEditingController,
                key: const ValueKey("email"),
              ),
              const SizedBox(height: 24),
              InputLoginLayout(
                title:
                    "${AppLocalizations.instance.translate("enterYourPassword")}*",
                focusNode: passwordFocusNode,
                obscureText: true,
                textInputAction: TextInputAction.done,
                inputLoginLayouts: InputLoginLayouts.password,
                focusOtherField: () {
                  passwordFocusNode.unfocus();
                },
                textInputType: TextInputType.text,
                textEditingController: passwordTextEditingController,
                emailTextEditingController: emailTextEditingController,
                key: const ValueKey("password"),
              ),
              const SizedBox(height: 24),
              SizedBox(
                  height: 24,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/privacy_policy");
                    },
                    child: Text(
                      AppLocalizations.instance.translate("privacyPolicy"),
                      style: const TextStyle(color: primary700),
                    ),
                  )),
              const Spacer(),
              RoundedButton(
                  onPress: () {
                    passwordFocusNode.unfocus();
                    emailFocusNode.unfocus();
                    if (!state.isLoading) {
                      BlocProvider.of<LoginBloc>(context).add(ValidateForm(
                          context: context,
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text));
                    }
                  },
                  color: primary1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.isLoading)
                        const CupertinoActivityIndicator(
                          color: primary50,
                          radius: 8,
                        ),
                      if (state.isLoading)
                        const SizedBox(
                          width: 5,
                        ),
                      Text(
                        AppLocalizations.instance.translate("enter"),
                        style: const TextStyle(
                            color: primary50,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      if (state.isLoading)
                        const SizedBox(
                          width: 21,
                        ),
                    ],
                  )),
              const SizedBox(height: 24),
              SizedBox(
                height: 44,
                child: Center(
                    child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "${AppLocalizations.instance.translate("dontHaveAccount")}?",
                      style: const TextStyle(
                          letterSpacing: 0.5,
                          color: primary700,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          passwordFocusNode.unfocus();
                          emailFocusNode.unfocus();
                          if (!state.isLoading) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/registration", (route) => false);
                          }
                        },
                        child: Text(
                          AppLocalizations.instance.translate("create"),
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: primary700,
                              letterSpacing: 0.5,
                              color: primary700,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                )),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/reset_password", (route) => true);
                  },
                  child: SizedBox(
                    height: 44,
                    child: Center(
                      child: Text(
                        "${AppLocalizations.instance.translate("forgotPassword")}?",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: primary700,
                            color: primary700,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
