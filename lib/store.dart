import 'package:verzuz/participants/model.dart';

class AppState {
  List<Participant> participants;

  AppState({this.participants});

  static AppState fromJson(dynamic json) {
    if (json['participants'] != null) {
      var participants = List<Participant>();
      json['participants'].forEach((v) {
        participants.add(Participant.fromJson(v));
      });
      return AppState(participants: participants);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.participants != null) {
      data['participants'] = this.participants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
