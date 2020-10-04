import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  UserData._(this.userID, this.name, this.iconURL, this.created);

  factory UserData.fromFireStore(DocumentSnapshot doc) {
    return UserData._(doc.id, doc.data()['name'] ?? '',
        doc.data()['imageURL'] ?? '', doc.data()['createdAt']);
  }

  final String userID;
  final String name;
  final String iconURL;
  final DateTime created;
}
