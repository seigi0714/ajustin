// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginFormStateTearOff {
  const _$LoginFormStateTearOff();

// ignore: unused_element
  _LoginFormState call({String email, String pass}) {
    return _LoginFormState(
      email: email,
      pass: pass,
    );
  }
}

// ignore: unused_element
const $LoginFormState = _$LoginFormStateTearOff();

mixin _$LoginFormState {
  String get email;
  String get pass;

  $LoginFormStateCopyWith<LoginFormState> get copyWith;
}

abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res>;
  $Res call({String email, String pass});
}

class _$LoginFormStateCopyWithImpl<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  final LoginFormState _value;
  // ignore: unused_field
  final $Res Function(LoginFormState) _then;

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

abstract class _$LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormStateCopyWith(
          _LoginFormState value, $Res Function(_LoginFormState) then) =
      __$LoginFormStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String pass});
}

class __$LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res>
    implements _$LoginFormStateCopyWith<$Res> {
  __$LoginFormStateCopyWithImpl(
      _LoginFormState _value, $Res Function(_LoginFormState) _then)
      : super(_value, (v) => _then(v as _LoginFormState));

  @override
  _LoginFormState get _value => super._value as _LoginFormState;

  @override
  $Res call({
    Object email = freezed,
    Object pass = freezed,
  }) {
    return _then(_LoginFormState(
      email: email == freezed ? _value.email : email as String,
      pass: pass == freezed ? _value.pass : pass as String,
    ));
  }
}

class _$_LoginFormState
    with DiagnosticableTreeMixin
    implements _LoginFormState {
  const _$_LoginFormState({this.email, this.pass});

  @override
  final String email;
  @override
  final String pass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginFormState(email: $email, pass: $pass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginFormState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('pass', pass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginFormState &&
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
  _$LoginFormStateCopyWith<_LoginFormState> get copyWith =>
      __$LoginFormStateCopyWithImpl<_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState({String email, String pass}) =
      _$_LoginFormState;

  @override
  String get email;
  @override
  String get pass;
  @override
  _$LoginFormStateCopyWith<_LoginFormState> get copyWith;
}
