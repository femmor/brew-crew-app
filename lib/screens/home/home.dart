import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew", style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.login_outlined, color: Colors.grey[300], size: 26.0,),
              label: Text("Log Out", style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),)
          ),
        ],
      ),
    );
  }
}
