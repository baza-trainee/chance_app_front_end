part of 'registration_bloc.dart';

@immutable
class RegistrationState {
  final String firstName, lastName, phone, email, passwordFirst, passwordSecond;
  final RegistrationPages registrationPages;
  final double percentage;
  final PageController? pageController;

  final String? errorLastName,
      errorFirstName,
      errorPhone,
      errorEmail,
      errorFirstPassword,
      errorSecondPassword;
  final bool isUserGrantPermissionForProcessingPersonalData, isLoading;

  const RegistrationState({
    this.firstName = "",
    this.lastName = "",
    this.phone = "",
    this.email = "",
    this.passwordFirst = "",
    this.passwordSecond = "",
    this.registrationPages = RegistrationPages.first,
    this.percentage = 0.33,
    this.errorLastName,
    this.errorFirstName,
    this.errorPhone,
    this.errorEmail,
    this.errorFirstPassword,
    this.errorSecondPassword,
    this.pageController,
    this.isUserGrantPermissionForProcessingPersonalData = false,
    this.isLoading = false,
  });

  RegistrationState copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? passwordFirst,
    String? passwordSecond,
    RegistrationPages? registrationPages,
    double? percentage,
    String? errorLastName,
    String? errorFirstName,
    String? errorPhone,
    String? errorEmail,
    String? errorFirstPassword,
    String? errorSecondPassword,
    PageController? pageController,
    bool? isUserGrantPermissionForProcessingPersonalData,
    isLoading,
  }) {
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      passwordFirst: passwordFirst ?? this.passwordFirst,
      passwordSecond: passwordSecond ?? this.passwordSecond,
      registrationPages: registrationPages ?? this.registrationPages,
      percentage: percentage ?? this.percentage,
      errorLastName: errorLastName ?? this.errorLastName,
      errorFirstName: errorFirstName ?? this.errorFirstName,
      errorPhone: errorPhone ?? this.errorPhone,
      errorEmail: errorEmail ?? this.errorEmail,
      errorFirstPassword: errorFirstPassword ?? this.errorFirstPassword,
      errorSecondPassword: errorSecondPassword ?? this.errorSecondPassword,
      pageController: pageController ?? this.pageController,
      isLoading: isLoading ?? this.isLoading,
      isUserGrantPermissionForProcessingPersonalData:
          isUserGrantPermissionForProcessingPersonalData ??
              this.isUserGrantPermissionForProcessingPersonalData,
    );
  }

  RegistrationState clear() {
    return const RegistrationState(
      firstName: "",
      lastName: "",
      phone: "",
      email: "",
      passwordFirst: "",
      passwordSecond: "",
      registrationPages: RegistrationPages.first,
      percentage: 0.33,
      errorLastName: null,
      errorFirstName: null,
      errorPhone: null,
      errorEmail: null,
      errorFirstPassword: null,
      errorSecondPassword: null,
      pageController: null,
      isUserGrantPermissionForProcessingPersonalData: false,
      isLoading: false,
    );
  }
}
