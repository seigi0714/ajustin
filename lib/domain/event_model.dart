import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {}

// 予定
class Item {
  Item._(
    this.kind,
    this.summary,
    this.description,
    this.location,
    this.creator,
    this.start,
    this.end,
  );

  factory Item.fromFireStore(DocumentSnapshot doc) {
    return Item._(
      doc.data()['kind'] ?? '',
      doc.data()['summary'] ?? 'no title',
      doc.data()['description'] ?? '',
      doc.data()['location'] ?? '',
      Creator(email: doc.data()['creator']),
      Start(dateTime: Start.fromFireStore(doc.data()['start']).dateTime),
      End(dateTime: End.fromFireStore(doc.data()['end']).dateTime),
    );
  }

  final String kind;
  final String summary;
  final String description;
  final String location;
  final Creator creator;
  final Start start;
  final End end;
}

// 予定作成者
class Creator {
  Creator({
    this.email,
  });
  final String email;
}

// 開始時刻
class Start {
  Start({
    this.dateTime,
  });
  final DateTime dateTime;
  factory Start.fromFireStore(Timestamp date) {
    return Start(dateTime: date.toDate());
  }
}

// 終了時刻
class End {
  End({
    this.dateTime,
  });
  factory End.fromFireStore(Timestamp date) {
    return End(dateTime: date.toDate());
  }
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
  final DateTime dateTime;
}
