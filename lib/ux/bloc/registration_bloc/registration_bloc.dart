import 'dart:async';

import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/input_register_layout.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/registration_page.dart';
import 'package:chance_app/ux/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<LoadData>(_onLoadData);
    on<SaveFirstName>(_onSaveFirstName);
    on<SaveLastName>(_onSaveLastName);
    on<SavePhone>(_onSavePhone);
    on<SaveEmail>(_onSaveEmail);
    on<SavePasswordFirst>(_onSavePasswordFirst);
    on<SavePasswordSecond>(_onSavePasswordSecond);
    on<IncreaseCurrentStep>(_onIncreaseCurrentStep);
    on<DecreaseCurrentStep>(_onDecreaseCurrentStep);
    on<Dispose>(_onDispose);
    on<ValidateForm>(_onValidateForm);
    on<ClearData>(_onClearData);
    on<ChangeUserGrantPermissionForProcessingPersonalData>(
        _onChangeUserGrantPermissionForProcessingPersonalData);
  }

  FutureOr<void> _onSaveFirstName(
      SaveFirstName event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(firstName: event.firstName));
  }

  FutureOr<void> _onSaveLastName(
      SaveLastName event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  FutureOr<void> _onSavePhone(
      SavePhone event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  FutureOr<void> _onSaveEmail(
      SaveEmail event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onSavePasswordFirst(
      SavePasswordFirst event, Emitter<RegistrationState> emit) {
    emit(
        state.copyWith(passwordFirst: event.passwordFirst.replaceAll(" ", "")));
  }

  FutureOr<void> _onSavePasswordSecond(
      SavePasswordSecond event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
        passwordSecond: event.passwordSecond.replaceAll(" ", "")));
  }

  FutureOr<void> _onIncreaseCurrentStep(
      IncreaseCurrentStep event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(isLoading: true));

    if (state.registrationPages != RegistrationPages.third) {
      int index = RegistrationPages.values.indexOf(state.registrationPages) + 1;
      RegistrationPages registrationPages = RegistrationPages.values[index];

      state.pageController!.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      double plusPercentage = 0.33;
      if (index == 1) {
        plusPercentage = 0.34;
      }
      if (index - 1 == 0) {
        emit(state.copyWith(firstName: event.second, lastName: event.first));
      } else if (index - 1 == 1) {
        emit(state.copyWith(
            email: event.second,
            phone: "+380${event.first}".trim().replaceAll(" ", "")));
      }
      if (validate(emit)) {
        emit(state.copyWith(
            percentage: state.percentage + plusPercentage,
            registrationPages: registrationPages));
      }
    } else {
      emit(state.copyWith(
          passwordSecond: event.second.replaceAll(" ", ""),
          passwordFirst: event.first.replaceAll(" ", "")));
      if (validate(emit)) {
        await UserRepository()
            .sendRegisterData(state.lastName, state.firstName, state.phone,
                state.email, state.passwordFirst)
            .then((value) {
          if (value == null) {
            Navigator.of(event.context)
                .pushNamedAndRemoveUntil("/enter_code", (context) => true);
          }
        });
      }
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onDecreaseCurrentStep(
      DecreaseCurrentStep event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isLoading: true));

    if (state.registrationPages != RegistrationPages.first) {
      int index = RegistrationPages.values.indexOf(state.registrationPages) - 1;
      RegistrationPages registrationPages = RegistrationPages.values[index];
      state.pageController!.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      double plusPercentage = 0.33;
      if (index == 1) {
        plusPercentage = 0.34;
      }
      emit(state.copyWith(
          percentage: state.percentage - plusPercentage,
          registrationPages: registrationPages));
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onDispose(Dispose event, Emitter<RegistrationState> emit) {
    state.pageController!.dispose();
    emit(state.clear());
  }

  FutureOr<void> _onValidateForm(
      ValidateForm event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isLoading: true));
    String text = event.text;
    switch (event.inputLayouts) {
      case InputLayouts.lastName:
        emit(state.copyWith(
            lastName: text, errorLastName: validateLastName(text) ?? ""));
        break;
      case InputLayouts.firstName:
        emit(state.copyWith(
            firstName: text, errorFirstName: validateFirstName(text) ?? ""));

        break;
      case InputLayouts.phone:
        emit(
            state.copyWith(phone: text, errorPhone: validatePhone(text) ?? ""));
        break;
      case InputLayouts.email:
        emit(
            state.copyWith(email: text, errorEmail: validateEmail(text) ?? ""));

        break;
      case InputLayouts.firstPassword:
        text = text.replaceAll(" ", "");
        emit(state.copyWith(
            passwordFirst: text,
            errorFirstPassword: validateFirstPassword(text) ?? ""));

        break;
      case InputLayouts.lastPassword:
        text = text.replaceAll(" ", "");
        emit(state.copyWith(
            passwordSecond: text,
            errorSecondPassword: validateSecondPassword(text) ?? ""));
        break;
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onLoadData(LoadData event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(pageController: PageController(initialPage: 0)));
  }

  FutureOr<void> _onChangeUserGrantPermissionForProcessingPersonalData(
      ChangeUserGrantPermissionForProcessingPersonalData event,
      Emitter<RegistrationState> emit) {
    emit(state.copyWith(
        isUserGrantPermissionForProcessingPersonalData:
            !state.isUserGrantPermissionForProcessingPersonalData));
  }

  bool validate(Emitter<RegistrationState> emit) {
    String text = state.lastName;
    String? errorTextFN,
        errorTextLN,
        errorTextEmail,
        errorTextPhone,
        errorTextFP,
        errorTextLP;
    text = state.firstName;
    errorTextFN = validateFirstName(text);
    text = state.lastName;
    errorTextLN = validateLastName(text);

    text = state.phone;
    errorTextPhone = validatePhone(text);

    text = state.email;
    errorTextEmail = validateEmail(text);

    text = state.passwordFirst.replaceAll(" ", "");

    errorTextFP = validateFirstPassword(text);

    text = state.passwordSecond.replaceAll(" ", "");
    errorTextLP = validateSecondPassword(text);

    int index = RegistrationPages.values.indexOf(state.registrationPages);
    if (index == 0) {
      emit(state.copyWith(
        errorLastName: errorTextLN ?? "",
        errorFirstName: errorTextFN ?? "",
      ));
    } else if (index == 1) {
      emit(state.copyWith(
        errorEmail: errorTextEmail ?? "",
        errorPhone: errorTextPhone ?? "",
      ));
    } else if (index == 2) {
      emit(state.copyWith(
        errorFirstPassword: errorTextFP ?? "",
        errorSecondPassword: errorTextLP ?? "",
      ));
    }

    if (errorTextLN == null || errorTextLN.trim().isEmpty) {
      if (errorTextFN == null || errorTextFN.trim().isEmpty) {
        if (errorTextEmail == null || errorTextEmail.trim().isEmpty) {
          if (errorTextPhone == null || errorTextPhone.trim().isEmpty) {
            if (errorTextFP == null || errorTextFP.trim().isEmpty) {
              if (errorTextLP == null || errorTextLP.trim().isEmpty) {
                if (state.isUserGrantPermissionForProcessingPersonalData) {
                  return true;
                } else {
                  Fluttertoast.showToast(
                      msg: AppLocalizations.instance.translate(
                          "youNeedToGivePermissionForTheProcessingOfPersonalData"));
                  state.pageController!.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  emit(state.copyWith(
                      registrationPages: RegistrationPages.values[2],
                      percentage: 1));
                }
              } else {
                state.pageController!.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
                emit(state.copyWith(
                    registrationPages: RegistrationPages.values[2],
                    percentage: 1));
              }
            } else {
              state.pageController!.animateToPage(2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              emit(state.copyWith(
                  registrationPages: RegistrationPages.values[2],
                  percentage: 1));
            }
          } else {
            state.pageController!.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            emit(state.copyWith(
                registrationPages: RegistrationPages.values[1],
                percentage: 0.66));
          }
        } else {
          state.pageController!.animateToPage(1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
          emit(state.copyWith(
              registrationPages: RegistrationPages.values[1],
              percentage: 0.66));
        }
      } else {
        state.pageController!.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        emit(state.copyWith(
            registrationPages: RegistrationPages.values[0], percentage: 0.33));
      }
    } else {
      state.pageController!.animateToPage(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      emit(state.copyWith(
          registrationPages: RegistrationPages.values[0], percentage: 0.33));
    }
    return false;
  }

  FutureOr<void> _onClearData(
      ClearData event, Emitter<RegistrationState> emit) {
    emit(state.clear());
  }

  String? validateFirstName(String text) {
    if (text.trim().isEmpty) {
      return AppLocalizations.instance.translate("surnameIsEmpty");
    }
    if (text.trim().length < 2) {
      return AppLocalizations.instance
          .translate("surnameMustHaveAtLeast2Characters");
    }

    if (text.trim().length > 50) {
      return AppLocalizations.instance
          .translate("surnameMustNotExceed50Characters");
    }
    RegExp regex = RegExp(r"^[a-zA-Zа-яА-ЯІіЇїЄєҐґ\s\'-]+$");
    if (!regex.hasMatch(text)) {
      return AppLocalizations.instance.translate("invalidCharacters");
    }
    return null;
  }

  String? validateLastName(String text) {
    if (text.trim().isEmpty) {
      return AppLocalizations.instance.translate("nameIsEmpty");
    }

    if (text.trim().length < 2) {
      return AppLocalizations.instance
          .translate("nameMustHaveAtLeast2Characters");
    }

    if (text.trim().length > 30) {
      return AppLocalizations.instance
          .translate("nameMustNotExceed30Characters");
    }
    RegExp regex = RegExp(r"^[a-zA-Zа-яА-ЯІіЇїЄєҐґ\s\'-]+$");
    if (!regex.hasMatch(text)) {
      return AppLocalizations.instance.translate("invalidCharacters");
    }

    return null;
  }

  String? validatePhone(String text) {
    text = text.replaceAll(" ", "");
    if (text.contains("+380")) {
      if (!RegExp(r'^\+380\d{9}$').hasMatch(text)) {
        return AppLocalizations.instance.translate("invalidPhoneNumberFormat");
      }
    }else{
      if (!RegExp(r'^\d{9}$').hasMatch(text)) {
        return AppLocalizations.instance.translate("invalidPhoneNumberFormat");
      }
    }

    return null;
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

  String? validateFirstPassword(String text) {
    if (text.trim().length >= 8) {
      if (text.trim().length <= 14) {
        return null;
      } else {
        return AppLocalizations.instance
            .translate("passwordMustBeLessThan14Characters");
      }
    } else {
      return AppLocalizations.instance
          .translate("passwordMustBe8OrMoreCharacters");
    }
  }

  String? validateSecondPassword(String text) {
    if (text.trim().length >= 8) {
      if (text.trim().length <= 14) {
        if (state.passwordFirst == text) {
          return null;
        } else {
          return AppLocalizations.instance.translate("passwordsDoNotMatch");
        }
      } else {
        return AppLocalizations.instance
            .translate("passwordMustBeLessThan14Characters");
      }
    } else {
      return AppLocalizations.instance
          .translate("passwordMustBe8OrMoreCharacters");
    }
  }
}
