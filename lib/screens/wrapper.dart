import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import "package:flutter/material.dart";
import 'package:brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    access the user data from the provider
  final user = Provider.of<AppUser>(context);
  print(user);
//  Return either home or authenticate widget
    return Authenticate();
  }
}
