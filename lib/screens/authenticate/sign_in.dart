import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Create an instance of the AuthService function
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

//  Text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text(
                "Sign in to Brew Crew",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.grey[100],
                  ),
                  label: Text("Sign Up",
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16.0,
                      )),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Please enter email" : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.length < 6
                          ? "Password should be greater than 6 characters"
                          : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() => {
                                  error =
                                      "Could not sign in with those credentials, please try again!",
                                  loading = false
                                });
                          }
                        }
                      },
                      color: Colors.pink,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
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
