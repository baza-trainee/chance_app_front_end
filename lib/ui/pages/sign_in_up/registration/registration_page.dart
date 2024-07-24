import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/first_sub_page.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/second_sub_page.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/third_sub_page.dart';
import 'package:chance_app/ux/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
enum RegistrationPages{first,second,third}
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
  late AnimationController controller;


  @override
  void initState() {
    controller = AnimationController(
      value: 0,
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {

      });
    BlocProvider.of<RegistrationBloc>(context)
        .add(LoadData());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
  void onBack(RegistrationState state){
    if (state.registrationPages == RegistrationPages.first) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(

              title: Text(
                "${AppLocalizations.instance.translate("wannaLeaveRegistration")}?",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: primaryText),
              ),
              content: Text(
                AppLocalizations.instance.translate("whenYouCloseRegistrationDataWontBeSave"),
                textAlign: TextAlign.center,
                style: const TextStyle(color: primaryText, fontSize: 16),
              ),
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.instance.translate("continue"),
                        style: const TextStyle(fontSize: 16, color: primary500),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "/signinup", (route) => false);
                        BlocProvider.of<RegistrationBloc>(context)
                            .add(Dispose());
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
    } else {
      BlocProvider.of<RegistrationBloc>(context)
          .add(DecreaseCurrentStep());
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
      controller.value = state.percentage;
      return PopScope(
        canPop: false,
        onPopInvoked: (value){
          onBack(state);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              centerTitle: true,
              title:  Text(AppLocalizations.instance.translate("registration")),
              leading: BackButton(
                onPressed: () {
                  onBack(state);
                },
              )),
          backgroundColor: beigeBG,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor: darkNeutral300,
                  color: darkNeutral600,
                  borderRadius: BorderRadius.circular(100),
                  value: controller.value,
                ),
                Expanded(
                  child: PageView(
                    controller: state.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const <Widget>[
                      FirstSubPage(),
                      SecondSubPage(),
                      ThirdSubPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
