import 'package:cloud_firestore/cloud_firestore.dart';

class Event {}

// 予定
class Item {
  Item(
//    種類
    this.kind,
//   タイトル
    this.summary,
//    詳細
    this.description,
//    場所
    this.location,
//    予定作者
    this.creator,
    this.start,
    this.end,
  );

  factory Item.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data();
    return Item(
        data['kind'],
        data['summary'],
        data['description'] ?? '',
        data['location'] ?? '',
        Creator(email: data['creator']),
        Start(dateTime: data['start'].toDate()),
        End(dateTime: data['end'].toDate));
  }

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
