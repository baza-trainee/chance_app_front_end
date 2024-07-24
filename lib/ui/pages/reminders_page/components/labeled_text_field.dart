import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LabeledTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String prefixText;
  final bool isPhone;
  final ValueChanged<String>? onChanged;

  const LabeledTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.prefixText,
    required this.isPhone,
    required this.controller,
    this.onChanged,
  });

  @override
  LabeledTextFieldState createState() => LabeledTextFieldState();
}

class LabeledTextFieldState extends State<LabeledTextField> {
  String? errorText;
  bool isFocused = false;

  static LabeledTextFieldState? nameTextField;
  static LabeledTextFieldState? phoneTextField;

  bool validateInput(String input) {
    if (widget.isPhone) {
      final RegExp phoneRegex = RegExp(r'^\d{9}$');
      return phoneRegex.hasMatch(input);
    } else {
      final RegExp nameRegex = RegExp(r'^[а-яА-Яa-zA-Z\s]{2,30}$');
      return nameRegex.hasMatch(input);
    }
  }

  bool validate() {
    return validateInput(widget.controller.text);
  }

  void clear() {
    widget.controller.clear();
    errorText = null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.isPhone) {
      phoneTextField = this;
    } else {
      nameTextField = this;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF212833),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: TextField(
            onTapOutside: (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: widget.controller,
            decoration: InputDecoration(
              prefixIcon: widget.isPhone
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: CountryIcons.getSvgFlag("ua")),
                    )
                  : null,
              prefix: Text(
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF212833),
                  ),
                  widget.prefixText),
              hintText: widget.hintText,
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: beige300,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: beige300,
                  width: 1.0,
                ),
              ),
            ),
            onChanged: (value) {
              widget.onChanged?.call(value);
              setState(() {
                errorText = null;
              });
            },
            onEditingComplete: () {
              if (!validate()) {
                setState(() {
                  Fluttertoast.showToast(
                      msg: AppLocalizations.instance
                          .translate("checkTheEnteredData"));
                });
              }
            },
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
