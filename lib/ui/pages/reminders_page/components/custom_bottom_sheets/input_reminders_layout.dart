import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class InputRemindersLayout extends StatefulWidget {
  const InputRemindersLayout(
      {super.key,
      required this.textEditingController,
      required this.title,
      required this.subTitle,
      required this.saveData,
      required this.clearData});

  final TextEditingController textEditingController;
  final String title, subTitle;
  final Function(String value) saveData;
  final Function() clearData;

  @override
  State<InputRemindersLayout> createState() => _InputRemindersLayoutState();
}

class _InputRemindersLayoutState extends State<InputRemindersLayout> {
  late final TextEditingController textEditingController;
  late final String title, subTitle;
  String errorText = "";

  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool isError = false;

  @override
  void initState() {
    textEditingController = widget.textEditingController;
    title = widget.title;
    subTitle = widget.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: isError ? red900 : beige300),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontSize: 16, color: isError ? red900 : primaryText),
                      textInputAction: TextInputAction.done,
                      validator: (_) {
                        if (textEditingController.text.trimLeft().length > 1) {
                          if (textEditingController.text.trimLeft().length <=
                              300) {
                            widget.saveData(textEditingController.text);
                          } else {
                            setState(() {
                              errorText = AppLocalizations.instance.translate(
                                  "theNameMustContainUpTo300Characters");
                            });
                          }
                        } else {
                          setState(() {
                            errorText = AppLocalizations.instance.translate(
                                "theNameMustContainAtLeast2Characters");
                          });
                        }

                        return null;
                      },
                      onChanged: widget.saveData,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: isError ? red900 : primaryText),
                          labelText: title),
                      autofocus: true,
                      controller: textEditingController,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        textEditingController.text = "";
                        widget.clearData();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: beige500,
                      )),
                ],
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
          ],
        ));
  }
}
