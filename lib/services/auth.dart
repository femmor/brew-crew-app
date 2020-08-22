import "package:firebase_auth/firebase_auth.dart";

class AuthService {
//  create an instance of the firebase auth to communicate with the firebase backend
final FirebaseAuth _auth = FirebaseAuth.instance;

//  sign in as anonymous
Future signInAnon() async {
  try {
    UserCredential result = await _auth.signInAnonymously();
    User user = result.user;
    return user;
  } catch(e) {
    print(e.toString());
    return null;
  }
}

//  sign in with email and password


//  register with email and password


//  sign out


}