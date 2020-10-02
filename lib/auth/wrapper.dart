import 'package:adjustin_app/auth/auth_state.dart';
import 'package:adjustin_app/screen/login/login_page.dart';
import 'package:adjustin_app/screen/top/top_page.dart';
import 'package:adjustin_app/screen/top/top_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<AuthController> authProvider =
    StateNotifierProvider((ref) => AuthController());
final StateNotifierProvider<TopController> pageProvider =
    StateNotifierProvider((ref) => TopController());

class Wrapper extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer(builder: (context, watch, child) {
          final authState = watch(authProvider.state);
          return authState.user != null ? TopPage() : LoginPage();
        }));
  }
}
