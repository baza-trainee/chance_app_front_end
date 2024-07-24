part of 'sos_contacts_bloc.dart';

class SosContactsState {
  final List<SosGroupModel> contacts;

  SosContactsState({this.contacts = const []});

  SosContactsState copyWith({List<SosGroupModel>? contacts}) {
    return SosContactsState(
      contacts: contacts ?? this.contacts,
    );
  }

  SosContactsState clear() {
    return SosContactsState(contacts: const []);
  }
}
