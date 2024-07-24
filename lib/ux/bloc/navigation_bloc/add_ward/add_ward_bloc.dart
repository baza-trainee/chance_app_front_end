import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/add_ward/components/input_ward_layout.dart';
import 'package:meta/meta.dart';

part 'add_ward_event.dart';

part 'add_ward_state.dart';

class AddWardBloc extends Bloc<AddWardEvent, AddWardState> {
  AddWardBloc() : super(const AddWardState()) {
    on<ValidateField>(_onValidateField);
    on<SaveName>(_onSaveName);
    on<SaveEmail>(_onSaveEmail);
    on<ClearData>(_onClearData);
  }

  FutureOr<void> _onValidateField(
      ValidateField event, Emitter<AddWardState> emit) {
    String text = event.text;
    switch (event.inputWardLayouts) {
      case InputWardLayouts.email:
        emit(
            state.copyWith(errorEmail: validateEmail(text) ?? "", email: text));
        break;
      case InputWardLayouts.name:
        emit(state.copyWith(errorName: validateName(text) ?? "", name: text));
        break;
    }
  }

  String? validateEmail(String text) {
    if (text.trim().isEmpty) {
      return AppLocalizations.instance.translate("invalidEmailFormat");
    }

    if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
            caseSensitive: false)
        .hasMatch(text)) {
      return AppLocalizations.instance.translate("invalidEmailFormat");
    }
    if (text.trim().isNotEmpty &&
        text.trim().length > 4 &&
        (text.contains(".ru", text.length - 4) ||
            text.contains(".by", text.length - 4) ||
            text.contains(".рф", text.length - 4))) {
      return AppLocalizations.instance.translate("invalidEmailFormat");
    }
    return null;
  }

  String? validateName(String text) {
    if (text.trim().isEmpty) {
      return AppLocalizations.instance.translate("nameIsEmpty");
    }

    if (text.trim().length < 2) {
      return AppLocalizations.instance.translate("nameMustHaveAtLeast2Characters");
    }

    if (text.trim().length > 30) {
      return AppLocalizations.instance.translate("nameMustNotExceed30Characters");
    }
    RegExp regex = RegExp(r"^[a-zA-Zа-яА-ЯІіЇїЄєҐґ\s\'-]+$");
    if (!regex.hasMatch(text)) {
      return AppLocalizations.instance.translate("invalidCharacters");
    }

    return null;
  }

  FutureOr<void> _onSaveName(SaveName event, Emitter<AddWardState> emit) {
    emit(state.copyWith(name: event.text));
  }

  FutureOr<void> _onSaveEmail(SaveEmail event, Emitter<AddWardState> emit) {
    emit(state.copyWith(email: event.text));
  }

  FutureOr<void> _onClearData(ClearData event, Emitter<AddWardState> emit) {
    emit(state.clear());
  }

}
