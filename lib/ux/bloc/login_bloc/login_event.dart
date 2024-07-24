part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SaveEmail extends LoginEvent{
  final String email;

  SaveEmail({required this.email});
}
class SavePassword extends LoginEvent{
  final String password;

  SavePassword({required this.password});
}
class ValidateField extends LoginEvent{
final InputLoginLayouts inputLoginLayout;
final String text;

ValidateField({required this.inputLoginLayout, required this.text});
}
class ValidateForm extends LoginEvent{
final BuildContext context;
final String email,password;

  ValidateForm({required this.context, required this.email, required this.password});
}
