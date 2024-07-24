part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class LoadData extends RegistrationEvent{
  LoadData();
}
class SaveFirstName extends RegistrationEvent{
  final String firstName;

  SaveFirstName({required this.firstName});
}

class SaveLastName extends RegistrationEvent{
  final String lastName;

  SaveLastName({required this.lastName});
}

class SavePhone extends RegistrationEvent{
  final String phone;
  final bool isCorrect;

  SavePhone({required this.phone, required this.isCorrect});
}

class SaveEmail extends RegistrationEvent{
  final String email;

  SaveEmail({required this.email});
}

class SavePasswordFirst extends RegistrationEvent{
  final String passwordFirst;

  SavePasswordFirst({required this.passwordFirst});
}
class SavePasswordSecond extends RegistrationEvent{
  final String passwordSecond;

  SavePasswordSecond({required this.passwordSecond});
}

class IncreaseCurrentStep extends RegistrationEvent{
  final BuildContext context;
  final String first,second;

  IncreaseCurrentStep({required this.context, required this.first, required this.second});
}
class DecreaseCurrentStep extends RegistrationEvent{
  DecreaseCurrentStep();
}

class Dispose extends RegistrationEvent{
  Dispose();
}

class ValidateForm extends RegistrationEvent{
  final InputLayouts inputLayouts;
  final String text;

  ValidateForm({required this.inputLayouts, required this.text});
}

class ChangeUserGrantPermissionForProcessingPersonalData extends RegistrationEvent{


  ChangeUserGrantPermissionForProcessingPersonalData();
}
class ClearData extends RegistrationEvent{
  ClearData();
}