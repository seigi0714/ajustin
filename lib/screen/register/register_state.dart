import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'register_state.freezed.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    String email,
    String pass,
  }) = _RegisterFormState;
}

class RegisterFormController extends StateNotifier<RegisterFormState> {
  RegisterFormController() : super(RegisterFormState(email: '', pass: '')) {}

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePass(String pass) {
    state = state.copyWith(pass: pass);
  }
}
