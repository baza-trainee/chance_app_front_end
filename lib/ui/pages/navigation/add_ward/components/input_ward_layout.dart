import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/add_ward/add_ward_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InputWardLayouts { email, name }

class InputWardLayout extends StatefulWidget {
  const InputWardLayout({
    super.key,
    required this.title,
    required this.focusNode,
    required this.textInputAction,
    required this.inputWardLayouts,
    this.focusOtherField,
    required this.textInputType,
    this.subTitle,
    required this.textEditingController,
    this.emailTextEditingController,
  });

  final String? title, subTitle;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final InputWardLayouts inputWardLayouts;
  final Function()? focusOtherField;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final TextEditingController? emailTextEditingController;

  @override
  State<InputWardLayout> createState() => _InputWardLayoutState();
}

class _InputWardLayoutState extends State<InputWardLayout> {
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  late final InputWardLayouts inputWardLayouts;
  bool isError = false;
  String? errorText;
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void initState() {
    inputWardLayouts = widget.inputWardLayouts;
    focusNode = widget.focusNode;
    errorText = widget.subTitle;
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        form.currentState?.validate();
      }
    });
    textEditingController = widget.textEditingController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddWardBloc, AddWardState>(builder: (context, state) {
      validate(state);
      return Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 14, color: isError ? red900 : primaryText),
                  ),
                ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: isError ? red900 : beige300),
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  keyboardType: widget.textInputType,
                  style: TextStyle(
                      fontSize: 16, color: isError ? red900 : primaryText),
                  textInputAction: widget.textInputAction,
                  validator: (value) {
                    if (value != null) {
                      BlocProvider.of<AddWardBloc>(context).add(ValidateField(
                          inputWardLayouts: inputWardLayouts, text: value));
                      if (widget.focusOtherField != null) {
                        widget.focusOtherField!();
                      }
                    }

                    return null;
                  },
                  onEditingComplete: () {
                    BlocProvider.of<AddWardBloc>(context).add(ValidateField(
                        inputWardLayouts: inputWardLayouts,
                        text: textEditingController.text));
                    if (widget.focusOtherField != null) {
                      widget.focusOtherField!();
                    }
                  },
                  onFieldSubmitted: (value) {
                    BlocProvider.of<AddWardBloc>(context).add(ValidateField(
                        inputWardLayouts: inputWardLayouts, text: value));
                    if (widget.focusOtherField != null) {
                      widget.focusOtherField!();
                    }
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  focusNode: focusNode,
                  controller: textEditingController,
                ),
              ),
              if (errorText != null && errorText!.trim().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    errorText!,
                    style: const TextStyle(fontSize: 14, color: red900),
                  ),
                ),
            ],
          ));
    });
  }

  void validate(AddWardState state) {
    switch (inputWardLayouts) {
      case InputWardLayouts.email:
        errorText = state.errorEmail;
        textEditingController.text = state.email;
        break;
      case InputWardLayouts.name:
        errorText = state.errorName;
        textEditingController.text = state.name;
        break;
    }
    isError = errorText != null && errorText!.trim().isNotEmpty;
  }
}
