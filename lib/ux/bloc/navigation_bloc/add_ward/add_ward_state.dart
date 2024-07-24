part of 'add_ward_bloc.dart';

@immutable
class AddWardState {
  final String name, email;

  final String? errorName, errorEmail;
  final bool isLoading;

  const AddWardState(
      {this.name = "",
      this.email = "",
      this.errorName,
      this.errorEmail,
      this.isLoading = false});

  AddWardState copyWith({
    String? name,
    String? email,
    String? errorName,
    String? errorEmail,
    bool? isLoading,
  }) {
    return AddWardState(
        name: name ?? this.name,
        email: email ?? this.email,
        errorName: errorName ?? this.errorName,
        errorEmail: errorEmail ?? this.errorEmail,
        isLoading: isLoading ?? this.isLoading);
  }

  AddWardState clear() {
    return const AddWardState(
        name: "",
        email: "",
        errorName: null,
        errorEmail: null,
        isLoading: false);
  }
}
