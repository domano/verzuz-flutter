import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:verzuz/participants/actions.dart';
import 'package:verzuz/participants/model.dart';
import 'package:verzuz/store.dart';

class AddParticipantDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ctrl = TextEditingController();
    return StoreConnector<AppState, OnOkCallback>(converter: (store) {
      return (participant) {
        Navigator.pop(context);
        store.dispatch(AddParticipantAction(participant));
      };
    }, builder: (context, callback) {
      return Dialog(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "Please enter a name"),
                controller: ctrl,
                onSubmitted: (name) => callback(Participant(name: name)),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => callback(Participant(name: ctrl.text)),
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )
        ],
      ));
    });
  }
}

typedef OnOkCallback = Function(Participant);
