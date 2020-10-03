class Event {}

// 予定
class Item {
  Item({
    this.kind,
    this.summary,
    this.description,
    this.location,
    this.creator,
    this.start,
    this.end,
  });

  String kind;
  String summary;
  String description;
  String location;
  Creator creator;
  Start start;
  End end;
}

// 予定作成者
class Creator {
  Creator({
    this.email,
  });
  String email;
}

// 開始時刻
class Start {
  Start({
    this.dateTime,
  });
  DateTime dateTime;
}

// 終了時刻
class End {
  End({
    this.dateTime,
  });
  factory End.fromJson(Map<String, dynamic> json) {
    String dateToParse;
    if (json['dateTime'] == null) {
      dateToParse = json['date'] as String;
    } else {
      dateToParse = json['dateTime'].toString().substring(0, 19);
    }
    return End(
      dateTime: DateTime.parse(dateToParse),
    );
  }
  DateTime dateTime;
}
