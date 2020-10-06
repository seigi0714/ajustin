import 'package:adjustin_app/domain/event_model.dart';
import 'package:adjustin_app/domain/user_model.dart';
import 'package:adjustin_app/service/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState(
      {Map<DateTime, List<dynamic>> events,
      List<dynamic> selectedEvents,
      DateTime focusDate,
      bool loading}) = _CalendarState;
}

class CalendarStateController extends StateNotifier<CalendarState> {
  CalendarStateController(this.user)
      : super(
          CalendarState(
              events: null,
              selectedEvents: [],
              focusDate: DateTime.now(),
              loading: true),
        ) {
    init(user);
  }
  UserData user;

  final db = FirebaseFirestore.instance;

  Future init(UserData user) async {
    final QuerySnapshot eventsDoc = await db
        .collection('users')
        .doc(user.userID)
        .collection('events')
        .get();
    final docIds = eventsDoc.docs.map((doc) => doc.id);
    List<Future<Item>> tasks = docIds.map((id) async {
      return _fetchMyItem(id);
    }).toList();
    final List<Item> items = await Future.wait(tasks);
    final Map<DateTime, List<Item>> events = _getCalendarEvents(items);
    state = state.copyWith(events: events, loading: false);
  }

  Map<DateTime, List<Item>> _getCalendarEvents(List<Item> items) {
    Map<DateTime, List<Item>> calendarEvents = {};

    for (int i = 0; i < items.length; i++) {
      if (items[i].start == null || items[i].end == null) continue;

      List keyDates =
          _getKeyDates(items[i].start.dateTime, items[i].end.dateTime);

      for (int j = 0; j < keyDates.length; j++) {
        if (calendarEvents[keyDates[j]] == null) {
          calendarEvents[keyDates[j]] = [items[i]];
        } else {
          calendarEvents[keyDates[j]].add(items[i]);
        }
      }
    }
    return calendarEvents;
  }

  List _getKeyDates(DateTime startDateTime, DateTime endDateTime) {
    DateTime startDate = _getAddedDate(startDateTime);
    DateTime endDate = _getAddedDate(endDateTime);

    List keyDates = [];
    // 予定が日付を跨ぐ時
    // 最後の日付が0時0分0秒のときにはその日付を省く
    int loopNum = endDateTime.hour == 0 &&
            endDateTime.minute == 0 &&
            endDateTime.second == 0
        ? endDate.difference(startDate).inDays - 1
        : endDate.difference(startDate).inDays;

    for (int i = 0; i <= loopNum; i++) {
      keyDates.add(_getAddedDate(startDate, i));
    }
    return keyDates;
  }

  /**
   * 任意の数進めた日付を取得する
   */
  DateTime _getAddedDate(dateTime, [int numToAdd = 0]) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day + numToAdd);
  }

  Future<Item> _fetchMyItem(String id) async {
    final DocumentSnapshot eventDoc =
        await FirebaseService().db.collection('events').doc(id).get();
    final Item event = Item.fromFireStore(eventDoc);
    return event;
  }

  void onDaySelected(DateTime day, List<dynamic> events) {
    state = state.copyWith(focusDate: day, selectedEvents: events);
  }

  void onVisibleDaysChanged(DateTime date) {
    state = state.copyWith(focusDate: date);
  }
}
