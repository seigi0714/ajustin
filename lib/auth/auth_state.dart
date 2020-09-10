import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
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

  void _userState() {
    final Auth.User firebaseUser = Auth.FirebaseAuth.instance.currentUser;
    state = state.copyWith(user: firebaseUser);
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
    } catch (e) {
      throw (_convertErrorMessage(e.code));
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
          .set({
        'createdAt': DateTime.now(),
      });
      _userState();
    } catch (e) {
      throw (_convertErrorMessage(e.code));
    }
  }
}

String _convertErrorMessage(e) {
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
