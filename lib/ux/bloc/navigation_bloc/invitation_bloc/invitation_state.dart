part of 'invitation_bloc.dart';

@immutable
class InvitationState {
  final List<InvitationModel> invitationsForMe;
  final List<InvitationModel> invitationsFromMe;
  final List<InvitationModel> myWards;
  final List<InvitationModel> myGuardians;

  final String? errorInvitationsForMe, errorInvitationsFromMe,errorMyWards,errorMyGuardians;
  final int page;
  final bool isLoading;

  const InvitationState({
    this.invitationsForMe = const [],
    this.invitationsFromMe = const [],
    this.myWards = const [],
    this.myGuardians = const [],
    this.errorInvitationsForMe,
    this.errorInvitationsFromMe,
    this.errorMyWards,
    this.errorMyGuardians,
    this.page = 0,
    this.isLoading = false,
  });

  InvitationState copyWith({
    List<InvitationModel>? invitationsForMe,
    List<InvitationModel>? invitationsFromMe,
    List<InvitationModel>? myWards,
    List<InvitationModel>? myGuardians,
    String? errorInvitationsForMe,
    String? errorInvitationsFromMe,
    String? errorMyWards,
    String? errorMyGuardians,
    int? page,
    bool? isLoading,
  }) {
    return InvitationState(
      errorInvitationsForMe:
          errorInvitationsForMe ?? this.errorInvitationsForMe,
      errorInvitationsFromMe:
          errorInvitationsFromMe ?? this.errorInvitationsFromMe,
      page: page ?? this.page,
      invitationsForMe: invitationsForMe ?? this.invitationsForMe,
      invitationsFromMe: invitationsFromMe ?? this.invitationsFromMe,
      isLoading: isLoading ?? this.isLoading,
      myWards: myWards ?? this.myWards,
      errorMyWards: errorMyWards ?? this.errorMyWards,
      errorMyGuardians: errorMyGuardians ?? this.errorMyGuardians,
      myGuardians: myGuardians ?? this.myGuardians,
    );
  }
}
