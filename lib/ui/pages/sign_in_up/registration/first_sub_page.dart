import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/continue_log_in.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/input_register_layout.dart';
import 'package:flutter/material.dart';


class FirstSubPage extends StatefulWidget {
  const FirstSubPage({super.key});

  @override
  State<FirstSubPage> createState() => _FirstSubPageState();
}

class _FirstSubPageState extends State<FirstSubPage> {

  final FocusNode firstNameFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode();

  final TextEditingController firstNameEditingController =
  TextEditingController(),
      lastNameEditingController = TextEditingController();
@override
void dispose() {
  //firstNameFocusNode.dispose();
  //lastNameFocusNode.dispose();
  //firstNameEditingController.dispose();
  //lastNameEditingController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: MediaQuery.of(context).size.height,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 24),
            InputRegisterLayout(
              textEditingController: lastNameEditingController,
              title: "${AppLocalizations.instance.translate("enterName")}*",
              focusNode: lastNameFocusNode,
              useCancelButton: false,
              obscureText: false,
              textInputAction: TextInputAction.next,
              inputLayouts: InputLayouts.lastName,
              focusOtherField: () {
                lastNameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(firstNameFocusNode);
              },
              textInputType: TextInputType.name,
              key: const ValueKey("name"),
            ),
            const SizedBox(height: 24),
            InputRegisterLayout(
              title: "${AppLocalizations.instance.translate("enterSurname")}*",
              focusNode: firstNameFocusNode,
              useCancelButton: false,
              obscureText: false,
              textInputAction: TextInputAction.done,
              inputLayouts: InputLayouts.firstName,
              focusOtherField: () {
                firstNameFocusNode.unfocus();
              },
              textInputType: TextInputType.name,
              textEditingController: firstNameEditingController,
              key: const ValueKey("surname"),
            ),
            const Spacer(),
            ContinueLogIn(
              name: AppLocalizations.instance.translate("continue"),
              firstText: lastNameEditingController,
              secondText: firstNameEditingController,
              firstFocusNode: firstNameFocusNode,
              lastFocusNode: lastNameFocusNode,
            ),
            const Spacer(),
          ],
        ));
  }
}
