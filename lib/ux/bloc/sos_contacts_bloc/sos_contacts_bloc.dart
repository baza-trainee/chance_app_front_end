import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chance_app/ux/model/sos_contact_model.dart';
import 'package:chance_app/ux/repository/sos_repository.dart';
import 'package:flutter/material.dart';

part 'sos_contacts_event.dart';
part 'sos_contacts_state.dart';

class SosContactsBloc extends Bloc<SosContactsEvent, SosContactsState> {
  List<SosGroupModel> list = [];
  SosContactsBloc() : super(SosContactsState()) {
    on<SaveContact>(_onSaveContact);
    on<DeleteContact>(_onDeleteContact);
    on<DeleteGroup>(_onDeleteGroup);
    on<EditContact>(_onEditContact);
    on<LoadSosContactsEvent>(_onLoadContacts);
  }

  FutureOr<void> _onLoadContacts(
      LoadSosContactsEvent event, Emitter<SosContactsState> emit) async {
    try {
      await SosRepository().loadContacts().then(
        (value) {
          if (value != null) {
            list = value;
            emit(state.copyWith(contacts: value));
          }
        },
      );
    } catch (error) {
      // emit(SosContactsError(error.toString())); // Emit error state
    }
  }

  FutureOr<void> _onSaveContact(
      SaveContact event, Emitter<SosContactsState> emit) {
    list.add(event.contactModel);
    emit(state.copyWith(contacts: list));
    if (event.isGroup) {
      SosRepository().addGroupName(name: event.contactModel.name).then(
        (value) {
          SosRepository().saveContact(event.contactModel, groupId: value);
        },
      );
    } else {
      SosRepository().saveContact(event.contactModel);
    }
  }

  FutureOr<void> _onDeleteContact(
      DeleteContact event, Emitter<SosContactsState> emit) {
    list.removeWhere((element) => element.id == event.ids.first);
    emit(state.copyWith(contacts: list));
    SosRepository().removeContact(event.ids.first);
  }

  FutureOr<void> _onDeleteGroup(
      DeleteGroup event, Emitter<SosContactsState> emit) {
    list.removeWhere((element) => element.id == event.ids.first);
    emit(state.copyWith(contacts: list));
    SosRepository().removeGroup(event.ids.first);
  }

  FutureOr<void> _onEditContact(
      EditContact event, Emitter<SosContactsState> emit) async {
    final index = list
        .indexWhere((groupContact) => groupContact.id == event.contactModel.id);
    list[index] = event.contactModel;
    emit(state.copyWith(contacts: list));

    if (event.contactModel.name.isNotEmpty) {
      SosRepository().editGroup(event.contactModel);
      for (SosContactModel contact in event.contactModel.contacts) {
        SosRepository().editContacts(event.contactModel, contact);
      }
    } else {
      SosRepository()
          .editContact(event.contactModel, event.contactModel.contacts[0]);
    }
  }

  loadContacts() {}
}
