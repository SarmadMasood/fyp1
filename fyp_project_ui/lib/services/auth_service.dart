import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project_ui/helper/keyboard.dart';
import 'package:fyp_project_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  // // auth change user stream
  // Stream<User> get user {
  //   return _auth.onAuthStateChanged
  //     //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  //     .map(_userFromFirebaseUser);
  // }

  // sign in anon
  Future<String> verifyPhoneNumber(
      BuildContext context, String phoneNumber) async {
    String verification = '';
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          KeyboardUtil.hideKeyboard(context);
          Navigator.pushNamed(context, HomeScreen.routeName);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          verification = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
    return verification;
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
