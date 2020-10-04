// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

// ignore: unused_element
  _CalendarState call(
      {Map<DateTime, List<Item>> events,
      List<Item> selectedEvents,
      bool loading}) {
    return _CalendarState(
      events: events,
      selectedEvents: selectedEvents,
      loading: loading,
    );
  }
}

// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

mixin _$CalendarState {
  Map<DateTime, List<Item>> get events;
  List<Item> get selectedEvents;
  bool get loading;

  $CalendarStateCopyWith<CalendarState> get copyWith;
}

abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {Map<DateTime, List<Item>> events,
      List<Item> selectedEvents,
      bool loading});
}

class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object events = freezed,
    Object selectedEvents = freezed,
    Object loading = freezed,
  }) {
    return _then(_value.copyWith(
      events: events == freezed
          ? _value.events
          : events as Map<DateTime, List<Item>>,
      selectedEvents: selectedEvents == freezed
          ? _value.selectedEvents
          : selectedEvents as List<Item>,
      loading: loading == freezed ? _value.loading : loading as bool,
    ));
  }
}

abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<DateTime, List<Item>> events,
      List<Item> selectedEvents,
      bool loading});
}

class __$CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(
      _CalendarState _value, $Res Function(_CalendarState) _then)
      : super(_value, (v) => _then(v as _CalendarState));

  @override
  _CalendarState get _value => super._value as _CalendarState;

  @override
  $Res call({
    Object events = freezed,
    Object selectedEvents = freezed,
    Object loading = freezed,
  }) {
    return _then(_CalendarState(
      events: events == freezed
          ? _value.events
          : events as Map<DateTime, List<Item>>,
      selectedEvents: selectedEvents == freezed
          ? _value.selectedEvents
          : selectedEvents as List<Item>,
      loading: loading == freezed ? _value.loading : loading as bool,
    ));
  }
}

class _$_CalendarState with DiagnosticableTreeMixin implements _CalendarState {
  const _$_CalendarState({this.events, this.selectedEvents, this.loading});

  @override
  final Map<DateTime, List<Item>> events;
  @override
  final List<Item> selectedEvents;
  @override
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarState(events: $events, selectedEvents: $selectedEvents, loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('selectedEvents', selectedEvents))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.selectedEvents, selectedEvents) ||
                const DeepCollectionEquality()
                    .equals(other.selectedEvents, selectedEvents)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(selectedEvents) ^
      const DeepCollectionEquality().hash(loading);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {Map<DateTime, List<Item>> events,
      List<Item> selectedEvents,
      bool loading}) = _$_CalendarState;

  @override
  Map<DateTime, List<Item>> get events;
  @override
  List<Item> get selectedEvents;
  @override
  bool get loading;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
