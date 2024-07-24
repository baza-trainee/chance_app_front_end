part of 'add_ward_bloc.dart';

@immutable
abstract class AddWardEvent {}

class ValidateField extends AddWardEvent {
  final InputWardLayouts inputWardLayouts;
  final String text;

  ValidateField({required this.inputWardLayouts, required this.text});
}

class SaveName extends AddWardEvent {
  final String text;

  SaveName({required this.text});
}

class SaveEmail extends AddWardEvent {
  final String text;

  SaveEmail({required this.text});
}

class ClearData extends AddWardEvent {
  ClearData();
}
