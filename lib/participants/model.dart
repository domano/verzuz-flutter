class Participant {
  String name;
  bool isOut;
  bool hasLeft;

  Participant({this.name, this.isOut, this.hasLeft});

  Participant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isOut = json['isOut'];
    hasLeft = json['hasLeft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isOut'] = this.isOut;
    data['hasLeft'] = this.hasLeft;
    return data;
  }
}
