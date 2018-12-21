import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:verzuz/participants/add_dialog.dart';
import 'package:verzuz/store.dart';

class Participants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Participants"),
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemExtent: 20.0,
              itemCount: state.participants.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(state.participants[index].name));
              },
            ),
            floatingActionButton: FloatingActionButton(
                tooltip: "Add Participant",
                child: Icon(Icons.person_add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddParticipantDialog());
                }));
      },
    );
  }
}
