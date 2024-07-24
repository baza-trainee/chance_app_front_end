part of 'login_bloc.dart';
@immutable
class LoginState {
  final String email, password;
  final String errorEmail, errorPassword;
  final bool isLoading;

  const LoginState({
    this.email = "",
    this.password = "",
    this.errorEmail = "",
    this.errorPassword = "",
    this.isLoading = false,
  });

  LoginState copyWith({
    String? email,
    password,errorEmail,errorPassword,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  LoginState clear(){
    return const LoginState(
      email: "",
      password: "",
      errorEmail: "",
      errorPassword: "",
        isLoading:false,
    );
  }
}
