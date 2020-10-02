// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TopStateTearOff {
  const _$TopStateTearOff();

// ignore: unused_element
  _TopState call({int pageIndex}) {
    return _TopState(
      pageIndex: pageIndex,
    );
  }
}

// ignore: unused_element
const $TopState = _$TopStateTearOff();

mixin _$TopState {
  int get pageIndex;

  $TopStateCopyWith<TopState> get copyWith;
}

abstract class $TopStateCopyWith<$Res> {
  factory $TopStateCopyWith(TopState value, $Res Function(TopState) then) =
      _$TopStateCopyWithImpl<$Res>;
  $Res call({int pageIndex});
}

class _$TopStateCopyWithImpl<$Res> implements $TopStateCopyWith<$Res> {
  _$TopStateCopyWithImpl(this._value, this._then);

  final TopState _value;
  // ignore: unused_field
  final $Res Function(TopState) _then;

  @override
  $Res call({
    Object pageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
    ));
  }
}

abstract class _$TopStateCopyWith<$Res> implements $TopStateCopyWith<$Res> {
  factory _$TopStateCopyWith(_TopState value, $Res Function(_TopState) then) =
      __$TopStateCopyWithImpl<$Res>;
  @override
  $Res call({int pageIndex});
}

class __$TopStateCopyWithImpl<$Res> extends _$TopStateCopyWithImpl<$Res>
    implements _$TopStateCopyWith<$Res> {
  __$TopStateCopyWithImpl(_TopState _value, $Res Function(_TopState) _then)
      : super(_value, (v) => _then(v as _TopState));

  @override
  _TopState get _value => super._value as _TopState;

  @override
  $Res call({
    Object pageIndex = freezed,
  }) {
    return _then(_TopState(
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
    ));
  }
}

class _$_TopState with DiagnosticableTreeMixin implements _TopState {
  const _$_TopState({this.pageIndex});

  @override
  final int pageIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopState(pageIndex: $pageIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopState'))
      ..add(DiagnosticsProperty('pageIndex', pageIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TopState &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pageIndex);

  @override
  _$TopStateCopyWith<_TopState> get copyWith =>
      __$TopStateCopyWithImpl<_TopState>(this, _$identity);
}

abstract class _TopState implements TopState {
  const factory _TopState({int pageIndex}) = _$_TopState;

  @override
  int get pageIndex;
  @override
  _$TopStateCopyWith<_TopState> get copyWith;
}
