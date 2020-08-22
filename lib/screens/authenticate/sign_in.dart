import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Create an instance of the AuthService function
  final AuthService _auth = AuthService();

//  Text field state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew", style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),),
         centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "email address"
                    ),
                    onChanged: (val){
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "password"
                    ),
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    onPressed: () async {
                      print("Email: "+email +" Password: "+password);
                    },
                    color: Colors.pink[400],
                    child: Text("Sign In", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,

                    ),),
                  ),
                ],
              ),
          ),
//        child: RaisedButton(
//          child: Text("Sign in anon"),
//          onPressed: () async {
//            dynamic result = await _auth.signInAnon();
////            check if user is signed in
//            if(result == null) {
//              print("error signing in");
//            } else {
////              Listen for the authentication change and show the homepage
//              print("user signed in");
//              print(result.uid);
//            }
//          },
//        ),
      ),
    );
  }
}
