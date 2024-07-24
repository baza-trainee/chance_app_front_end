import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/repository/invitation_repository.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterAcceptCode extends StatefulWidget {
  const EnterAcceptCode({super.key});

  @override
  State<EnterAcceptCode> createState() => _EnterAcceptCodeState();
}

class _EnterAcceptCodeState extends State<EnterAcceptCode> {
  TextEditingController textEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();
  String? error;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: beigeBG,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Код підтвердження"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Введенням коду ви надаєте доступ відстежувати ваше місцезнаходження",
              style: TextStyle(
                  fontSize: 16,
                  color: primaryText,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Введіть код підтвердження",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: primaryText),
            ),
            const SizedBox(
              height: 24,
            ),
            PinCodeTextField(
              focusNode: focusNode,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(4),
                fieldHeight: size.width / 7,
                fieldWidth: size.width / 7,
                activeFillColor: isError ? red900 : primary800,
                selectedColor: isError ? red900 : primary800,
                inactiveColor: isError ? red900 : primary800,
                disabledColor: isError ? red900 : primary800,
              ),
              cursorColor: primary800,
              controller: textEditingController,
              appContext: context,
              length: 5,
              onSaved: (value) async {
                if (textEditingController.text.trim().length == 5) {
                  checkOnValidCode();
                }
              },
            ),
            if (isError)
              Text(
                error ?? "",
                style: const TextStyle(fontSize: 16, color: red900),
              ),
            const Spacer(),
            RoundedButton(
                onPress: checkOnValidCode,
                color: primary1000,
                child: const Text(
                  "Підтвердити",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: primary50),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> checkOnValidCode() async {
    await InvitationRepository()
        .checkOnValidCode(textEditingController.text)
        .then((value) {
      if (value == null) {
        isError = false;
        error = "";
        if (mounted) setState(() {});
        //Navigator.of(context).pop();
      } else {
        error = value;
        isError = true;
        if (mounted) setState(() {});
      }
    });
  }
}
