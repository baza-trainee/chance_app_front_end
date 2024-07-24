part of 'sos_contacts_bloc.dart';

@immutable
abstract class SosContactsEvent {}

class SaveContact extends SosContactsEvent {
  final SosGroupModel contactModel;
  final bool isGroup;

  SaveContact({required this.contactModel, required this.isGroup});
}

class DeleteContact extends SosContactsEvent {
  final List<String> ids;

  DeleteContact({required this.ids});
}

class DeleteGroup extends SosContactsEvent {
  final List<String> ids;

  DeleteGroup({required this.ids});
}

class EditContact extends SosContactsEvent {
  final SosGroupModel contactModel;

  EditContact({required this.contactModel});
}

class LoadSosContactsEvent extends SosContactsEvent {}
