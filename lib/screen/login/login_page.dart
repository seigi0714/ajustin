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
    LoginFormController loginFormController = watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: <Widget>[
              emailField(emailTextController, loginFormController),
              SizedBox(height: 10),
              passwordField(passTextController, loginFormController),
              SizedBox(),
              RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'ログイン',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      await context.read(authProvider).loginWithEmail(
                          loginFormController.state.email,
                          loginFormController.state.pass);
                    } catch (e) {
                      print(e.toString());
                    }
                  }),
              SizedBox(height: 60),
              Divider(
                thickness: 1,
              ),
              Text('SNSでのログインはこちら'),
              SizedBox(height: 10),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              SignInButton(Buttons.AppleDark, onPressed: () {}),
              SizedBox(height: 30),
              Text('アカウントをお持ちでない方は'),
              FlatButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
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
      style: TextStyle(height: 1),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 3.0,
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
      style: TextStyle(height: 1),
      decoration: InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 3.0,
            ),
          ),
          hintText: 'パスワード',
          prefixIcon: Icon(Icons.lock)));
}
