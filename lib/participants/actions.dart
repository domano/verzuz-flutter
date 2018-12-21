import 'package:verzuz/participants/model.dart';

class AddParticipantAction {
  final Participant participant;

  AddParticipantAction(this.participant);
}

class RemoveParticipantAction {
  final Participant participant;

  RemoveParticipantAction(this.participant);
}

class ParticipantIsOutAction {
  final Participant participant;

  ParticipantIsOutAction(this.participant);
}

class ParticipantHasLeftAction {
  final Participant participant;

  ParticipantHasLeftAction(this.participant);
}
