// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegisterFormStateTearOff {
  const _$RegisterFormStateTearOff();

// ignore: unused_element
  _RegisterFormState call({String email, String pass}) {
    return _RegisterFormState(
      email: email,
      pass: pass,
    );
  }
}

// ignore: unused_element
const $RegisterFormState = _$RegisterFormStateTearOff();

mixin _$RegisterFormState {
  String get email;
  String get pass;

  $RegisterFormStateCopyWith<RegisterFormState> get copyWith;
}

abstract class $RegisterFormStateCopyWith<$Res> {
  factory $RegisterFormStateCopyWith(
          RegisterFormState value, $Res Function(RegisterFormState) then) =
      _$RegisterFormStateCopyWithImpl<$Res>;
  $Res call({String email, String pass});
}

class _$RegisterFormStateCopyWithImpl<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._value, this._then);

  final RegisterFormState _value;
  // ignore: unused_field
  final $Res Function(RegisterFormState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object pass = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      pass: pass == freezed ? _value.pass : pass as String,
    ));
  }
}

abstract class _$RegisterFormStateCopyWith<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  factory _$RegisterFormStateCopyWith(
          _RegisterFormState value, $Res Function(_RegisterFormState) then) =
      __$RegisterFormStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String pass});
}

class __$RegisterFormStateCopyWithImpl<$Res>
    extends _$RegisterFormStateCopyWithImpl<$Res>
    implements _$RegisterFormStateCopyWith<$Res> {
  __$RegisterFormStateCopyWithImpl(
      _RegisterFormState _value, $Res Function(_RegisterFormState) _then)
      : super(_value, (v) => _then(v as _RegisterFormState));

  @override
  _RegisterFormState get _value => super._value as _RegisterFormState;

  @override
  $Res call({
    Object email = freezed,
    Object pass = freezed,
  }) {
    return _then(_RegisterFormState(
      email: email == freezed ? _value.email : email as String,
      pass: pass == freezed ? _value.pass : pass as String,
    ));
  }
}

class _$_RegisterFormState
    with DiagnosticableTreeMixin
    implements _RegisterFormState {
  const _$_RegisterFormState({this.email, this.pass});

  @override
  final String email;
  @override
  final String pass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterFormState(email: $email, pass: $pass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterFormState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('pass', pass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterFormState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.pass, pass) ||
                const DeepCollectionEquality().equals(other.pass, pass)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(pass);

  @override
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith =>
      __$RegisterFormStateCopyWithImpl<_RegisterFormState>(this, _$identity);
}

abstract class _RegisterFormState implements RegisterFormState {
  const factory _RegisterFormState({String email, String pass}) =
      _$_RegisterFormState;

  @override
  String get email;
  @override
  String get pass;
  @override
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith;
}
