import 'dart:async';

import 'package:chance_app/ux/model/invitation_model.dart';
import 'package:chance_app/ux/repository/invitation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'invitation_event.dart';

part 'invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  InvitationBloc() : super(const InvitationState()) {
    on<LoadInvitationsForMe>(_onLoadInvitationsForMe);
    on<LoadInvitationsFromMe>(_onLoadInvitationsFromMe);
    on<LoadMyWards>(_onLoadMyWards);
    on<LoadMyGuardians>(_onLoadMyGuardians);
  }

  FutureOr<void> _onLoadInvitationsForMe(
      LoadInvitationsForMe event, Emitter<InvitationState> emit) async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true, page: 0));
      String error = "";
      List<InvitationModel> list = [];
      await InvitationRepository().getInvitationForMe().then((value) {
        if (value is List<InvitationModel>) {
          list = value;
        } else {
          error = value;
        }
      });
      emit(state.copyWith(
          isLoading: false,
          errorInvitationsForMe: error,
          invitationsForMe: list));
    }
  }

  FutureOr<void> _onLoadInvitationsFromMe(
      LoadInvitationsFromMe event, Emitter<InvitationState> emit) async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true, page: 1));
      String error = "";
      List<InvitationModel> list = [];
      await InvitationRepository().getInvitationFromMe().then((value) {
        if (value is List<InvitationModel>) {
          list = value;
        } else {
          error = value;
        }
      });

      emit(state.copyWith(
          isLoading: false,
          errorInvitationsFromMe: error,
          invitationsFromMe: list));
    }
  }

  FutureOr<void> _onLoadMyWards(
      LoadMyWards event, Emitter<InvitationState> emit) async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true, page: 1));
      String error = "";
      List<InvitationModel> list = [];
      await InvitationRepository().getMyWards().then((value) {
        if (value is List<InvitationModel>) {
          list = value;
        } else {
          error = value;
        }
      });

      emit(
          state.copyWith(isLoading: false, errorMyWards: error, myWards: list));
    }
  }

  FutureOr<void> _onLoadMyGuardians(
      LoadMyGuardians event, Emitter<InvitationState> emit) async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true, page: 1));
      String error = "";
      List<InvitationModel> list = [];
      await InvitationRepository().getMyGuardians().then((value) {
        if (value is List<InvitationModel>) {
          list = value;
        } else {
          error = value;
        }
      });

      emit(state.copyWith(
          isLoading: false, errorMyGuardians: error, myGuardians: list));
    }
  }
}
