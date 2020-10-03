import 'package:adjustin_app/domain/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    Map<DateTime, List<Item>> events,
  }) = _CalendarState;

  factory CalendarState.fromJson(Map<String, dynamic> json) =>
      _$CalendarStateFromJson(json);
}

class CalendarStateController extends StateNotifier<CalendarState> {
  CalendarStateController() : super(CalendarState(events: null)) {}
}
