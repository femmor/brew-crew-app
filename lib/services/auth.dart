import 'package:brew_crew/models/user.dart';
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
//  create an instance of the firebase auth to communicate with the firebase backend
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebase user
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

//  auth change user stream
  Stream<AppUser> get user {
    return _auth
        .authStateChanges()
//      .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//  sign in as anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      //Firebase User
      User user = result.user;
      //Turn firebase user into user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Firebase user
      User user = result.user;
      // Convert firebase user to user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //Firebase user
      User user = result.user;
      //Turn firebase user into user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
