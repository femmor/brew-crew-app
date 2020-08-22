import 'package:brew_crew/models/user.dart';
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
//  create an instance of the firebase auth to communicate with the firebase backend
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebase user
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }


//  sign in as anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      // ignore: deprecated_member_use
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

//  sign in with email and password


//  register with email and password


//  sign out


}