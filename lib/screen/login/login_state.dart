import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({String email, String pass}) = _LoginFormState;
}

class LoginFormController extends StateNotifier<LoginFormState> {
  LoginFormController() : super(LoginFormState(email: '', pass: '')) {}

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePass(String pass) {
    state = state.copyWith(pass: pass);
  }
}
