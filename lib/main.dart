import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:verzuz/participants/actions.dart';
import 'package:verzuz/participants/model.dart';
import 'package:verzuz/participants/reducers.dart';
import 'package:verzuz/participants/view.dart';
import 'package:verzuz/store.dart';

void main() {
  runApp(
      VerzuzApp(Store<AppState>(_combineReducers, initialState: AppState())));
}

class VerzuzApp extends StatelessWidget {
  final Store<AppState> store;

  VerzuzApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(title: "Verzuz", home: Participants()));
  }
}

AppState _combineReducers(AppState state, action) {
  var participantReducer = combineReducers<List<Participant>>([
    TypedReducer<List<Participant>, AddParticipantAction>(
        addParticipantReducer),
    TypedReducer<List<Participant>, RemoveParticipantAction>(
        removeParticipantReducer),
    TypedReducer<List<Participant>, ParticipantIsOutAction>(
        participantOutReducer),
    TypedReducer<List<Participant>, ParticipantHasLeftAction>(
        participantLeftReducer),
  ]);
  return AppState(participants: participantReducer(state.participants, action));
}
