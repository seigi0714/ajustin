import 'package:adjustin_app/auth/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            context.read(authProvider).logout();
          },
          child: const Text(
            'ログアウト',
          ),
        ),
      ),
    );
  }
}
