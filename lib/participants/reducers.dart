import 'package:verzuz/participants/actions.dart';
import 'package:verzuz/participants/model.dart';

List<Participant> addParticipantReducer(
    List<Participant> participants, AddParticipantAction action) {
  return List.from(participants)..add(action.participant);
}

List<Participant> removeParticipantReducer(
    List<Participant> participants, RemoveParticipantAction action) {
  return List.from(participants)..remove(action.participant);
}

List<Participant> participantLeftReducer(
    List<Participant> participants, ParticipantHasLeftAction action) {
  var result = List.from(participants);
  result[result.indexOf(action.participant)].hasLeft = true;
  return result;
}

List<Participant> participantOutReducer(
    List<Participant> participants, ParticipantIsOutAction action) {
  var result = List.from(participants);
  result[result.indexOf(action.participant)].isOut = true;
  return result;
}
