import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({Auth.User user, bool loading}) = _AuthState;
}

class AuthController extends StateNotifier<AuthState> {
  AuthController()
      : super(AuthState(
          user: null,
          loading: false,
        )) {
    _userState();
  }

//  final _streamController = StreamController<AuthState>.broadcast();
//  Stream<AuthState> get stream => _streamController.stream;

//  @override
//  set state(AuthState state) {
//    super.state = state;
//    _streamController.add(state);
//  }
//
//  @override
//  void dispose() {
//    _streamController.close();
//    super.dispose();
//  }

  void _userState() {
    final firebaseUser = Auth.FirebaseAuth.instance.currentUser;
    state = AuthState(user: firebaseUser, loading: false);
  }

  Future loginWithEmail(String email, String pass) async {
    if (email.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (pass.isEmpty) {
      throw ('パスワードを入力してください');
    }
    try {
      await Auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      _userState();
    } on FirebaseException catch (e) {
      final Error error = ArgumentError(_convertErrorMessage(e.code));
      throw error;
    }
  }

  Future registerWithEmail(String email, String pass) async {
    if (email.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (pass.isEmpty) {
      throw ('パスワードを入力してください');
    }
    try {
      final result =
          await Auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user.uid)
          .set(<String, dynamic>{
        'createdAt': DateTime.now(),
      });
      _userState();
    } on FirebaseException catch (e) {
      final Error error = ArgumentError(_convertErrorMessage(e.code));
      throw error;
    }
  }

  Future logout() async {
    await Auth.FirebaseAuth.instance.signOut();
    _userState();
  }
}

String _convertErrorMessage(String e) {
  switch (e) {
    case 'invalid-email':
      return 'メールアドレスを正しい形式で入力してください';
    case 'wrong-password':
      return 'パスワードが間違っています';
    case 'user-not-found':
      return 'ユーザーが見つかりません';
    case 'user-disabled':
      return 'ユーザーが無効です';
    default:
      return '不明なエラーです';
  }
}
