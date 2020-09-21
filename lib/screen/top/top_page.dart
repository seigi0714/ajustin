import 'package:adjustin_app/auth/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader read) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('トップページ'),
        ),
        body: Container(
          child: RaisedButton(
            onPressed: () async {
              await context.read(authProvider).logout();
            },
            child: const Text('ログアウト'),
          ),
        ));
  }
}
