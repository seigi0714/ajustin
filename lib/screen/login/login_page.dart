import 'package:adjustin_app/auth/wrapper.dart';
import 'package:adjustin_app/screen/login/login_state.dart';
import 'package:adjustin_app/screen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider((ref) => LoginFormController());

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailTextController = TextEditingController();
    final passTextController = TextEditingController();
    final loginFormController = watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: <Widget>[
              emailField(emailTextController, loginFormController),
              const SizedBox(height: 10),
              passwordField(passTextController, loginFormController),
              const SizedBox(),
              RaisedButton(
                  color: Colors.blue,
                  child: const Text(
                    'ログイン',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      await context.read(authProvider).loginWithEmail(
                          loginFormController.state.email,
                          loginFormController.state.pass);
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                  }),
              const SizedBox(height: 60),
              const Divider(
                thickness: 1,
              ),
              const Text('SNSでのログインはこちら'),
              const SizedBox(height: 10),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              SignInButton(Buttons.AppleDark, onPressed: () {}),
              const SizedBox(height: 30),
              const Text('アカウントをお持ちでない方は'),
              FlatButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text(
                    '新規登録画面へ',
                    style: TextStyle(color: Colors.indigo),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget emailField(TextEditingController emailController,
    LoginFormController loginFormController) {
  return TextField(
      onChanged: (text) {
        loginFormController.changeEmail(text);
      },
      controller: emailController,
      style: const TextStyle(height: 1),
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          ),
          hintText: 'example@gmail.com'));
}

Widget passwordField(TextEditingController passController,
    LoginFormController loginFormController) {
  return TextField(
      onChanged: (text) {
        loginFormController.changePass(text);
      },
      controller: passController,
      obscureText: true,
      style: const TextStyle(height: 1),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          ),
          hintText: 'パスワード',
          prefixIcon: const Icon(Icons.lock)));
}
