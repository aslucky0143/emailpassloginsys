import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instace of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in
  Future<UserCredential> signInWithEmailandPassword(
      String email, password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout
  Future<void> signOut() async {
    return _auth.signOut();
  }

  //register
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//reset password
  Future<bool> sendPasswordResetLink(String email) async {
    
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
  //Errors
}
