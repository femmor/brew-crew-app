import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Create an instance of the AuthService function
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
         centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: RaisedButton(
          child: Text("Sign in anon"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
//            check if user is signed in
            if(result == null) {
              print("error signing in");
            } else {
              print("user signed in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
