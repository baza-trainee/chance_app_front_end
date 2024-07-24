part of 'invitation_bloc.dart';

@immutable
abstract class InvitationEvent {}


class LoadInvitationsForMe extends InvitationEvent{
  LoadInvitationsForMe();
}
class LoadInvitationsFromMe extends InvitationEvent{
  LoadInvitationsFromMe();
}
class LoadMyWards extends InvitationEvent{
  LoadMyWards();
}
class LoadMyGuardians extends InvitationEvent{
  LoadMyGuardians();
}

