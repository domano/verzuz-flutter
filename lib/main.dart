import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:verzuz/participants/actions.dart';
import 'package:verzuz/participants/model.dart';
import 'package:verzuz/participants/reducers.dart';
import 'package:verzuz/participants/view.dart';
import 'package:verzuz/store.dart';

void main() async {
  // Create Persistor
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(
        key: "verzuzApp",
        location:
            FlutterSaveLocation.sharedPreferences), // Or use other engines

    serializer:
        JsonSerializer<AppState>(AppState.fromJson), // Or use other serializers
  );

  // Load initial state
  final initialState = await persistor.load();

  runApp(VerzuzApp(Store<AppState>(_combineReducers,
      initialState: initialState ?? AppState(),
      middleware: [persistor.createMiddleware()])));
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
