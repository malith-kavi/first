import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/models/UserModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first/routes.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userWithFirebaseUserid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserid);
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, String username, String birthday) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // You can save additional user data like username and birthday to Firebase Firestore or Realtime Database here
      return _userWithFirebaseUserid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (err) {
      print(err.toString());
      //return null;
    }
  }
}
