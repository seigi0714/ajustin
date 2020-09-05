import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              emailField(),
              SizedBox(height: 10),
              passwordField(),
              SizedBox(),
              RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'ログイン',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {}),
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
              Text('アカウントをお持ちでない方はこちら')
            ],
          ),
        ),
      ),
    );
  }
}

Widget emailField() {
  return TextField(
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

Widget passwordField() {
  return TextField(
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
