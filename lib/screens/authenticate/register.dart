import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text("Sign up to Brew Crew", style: TextStyle(
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
                color: Colors.brown[800],
                child: Text("Register", style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,

                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
