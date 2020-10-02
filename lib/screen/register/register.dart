import 'package:adjustin_app/auth/wrapper.dart';
import 'package:adjustin_app/screen/register/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

final registerProvider =
    StateNotifierProvider.autoDispose((ref) => RegisterFormController());

class RegisterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailTextController = TextEditingController();
    final passTextController = TextEditingController();
    final registerController = watch(registerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: <Widget>[
              emailField(emailTextController, registerController),
              const SizedBox(height: 10),
              passwordField(passTextController, registerController),
              const SizedBox(height: 10),
              const Text('利用規約に同意して'),
              RaisedButton(
                  color: Colors.blue,
                  child: const Text(
                    '新規登録',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      await context.read(authProvider).registerWithEmail(
                          registerController.state.email,
                          registerController.state.pass);
                    } catch (e) {
                      print(e.toString());
                    }
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 60),
              const Divider(
                thickness: 1,
              ),
              const Text('SNSで登録の方はこちら'),
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
              width: 2,
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
              width: 2,
            ),
          ),
          hintText: 'パスワード',
          prefixIcon: const Icon(Icons.lock)));
}
