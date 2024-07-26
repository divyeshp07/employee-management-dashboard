import 'dart:async';

import 'package:employee_management_dashboard/core/exceptions/auth_exception/signin_exception';
import 'package:employee_management_dashboard/core/exceptions/auth_exception/signup_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future<void> signUP(
    String username,
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw SignUpException('Password is weak', 'weak password');
      } else if (e.code == 'email-already-in-use') {
        throw SignUpException(
            'The account already exixsts', 'account already exists');
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw SigninException(e.code, 'canot login' 'user not founnd');
      } else if (e.code == 'wrong-password') {
        throw SigninException(e.code, 'cannot login' 'wrong password');
      } else if (e.code == 'user-disable') {
        throw SigninException(e.code, 'cannot login' 'user is disabled');
      }
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}
