import 'package:adjustin_app/auth/auth_state.dart';
import 'package:adjustin_app/screen/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:state_notifier/state_notifier.dart';

final registerProvider =
    StateNotifierProvider.autoDispose((ref) => RegisterFormController());
final authProvider = StateNotifierProvider((ref) => AuthController());

class RegisterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailTextController = TextEditingController();
    final passTextController = TextEditingController();
    RegisterFormController registerController = watch(registerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: <Widget>[
              emailField(emailTextController, registerController),
              SizedBox(height: 10),
              passwordField(passTextController, registerController),
              SizedBox(height: 10),
              Text('利用規約に同意して'),
              RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    '新規登録',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    try {
                      context.read(authProvider).registerWithEmail(
                          registerController.state.email,
                          registerController.state.pass);
                    } catch (e) {
                      print(e.toString());
                    }
                  }),
              SizedBox(height: 60),
              Divider(
                thickness: 1,
              ),
              Text('SNSで登録の方はこちら'),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget emailField(TextEditingController controller,
    RegisterFormController registerController) {
  return TextField(
      onChanged: (text) {
        registerController.changeEmail(text);
      },
      controller: controller,
      style: TextStyle(height: 1),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          hintText: 'example@gmail.com'));
}

Widget passwordField(TextEditingController controller,
    RegisterFormController registerController) {
  return TextField(
      onChanged: (text) {
        registerController.changePass(text);
      },
      obscureText: true,
      style: TextStyle(height: 1),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          hintText: 'パスワード',
          prefixIcon: Icon(Icons.lock)));
}
