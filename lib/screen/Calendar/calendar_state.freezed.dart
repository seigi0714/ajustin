// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CalendarState _$CalendarStateFromJson(Map<String, dynamic> json) {
  return _CalendarState.fromJson(json);
}

class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

// ignore: unused_element
  _CalendarState call({Map<DateTime, List<dynamic>> events}) {
    return _CalendarState(
      events: events,
    );
  }
}

// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

mixin _$CalendarState {
  Map<DateTime, List<dynamic>> get events;

  Map<String, dynamic> toJson();
  $CalendarStateCopyWith<CalendarState> get copyWith;
}

abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call({Map<DateTime, List<dynamic>> events});
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
  }) {
    return _then(_value.copyWith(
      events: events == freezed
          ? _value.events
          : events as Map<DateTime, List<dynamic>>,
    ));
  }
}

abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<DateTime, List<dynamic>> events});
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
  }) {
    return _then(_CalendarState(
      events: events == freezed
          ? _value.events
          : events as Map<DateTime, List<dynamic>>,
    ));
  }
}

@JsonSerializable()
class _$_CalendarState with DiagnosticableTreeMixin implements _CalendarState {
  const _$_CalendarState({this.events});

  factory _$_CalendarState.fromJson(Map<String, dynamic> json) =>
      _$_$_CalendarStateFromJson(json);

  @override
  final Map<DateTime, List<dynamic>> events;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarState(events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarState'))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(events);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CalendarStateToJson(this);
  }
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState({Map<DateTime, List<dynamic>> events}) =
      _$_CalendarState;

  factory _CalendarState.fromJson(Map<String, dynamic> json) =
      _$_CalendarState.fromJson;

  @override
  Map<DateTime, List<dynamic>> get events;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
