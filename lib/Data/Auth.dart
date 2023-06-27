import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:placementor/Data/constantData.dart';

DocumentReference<Map<String, dynamic>>? userDocReference;
// DocumentReference<Map<String, dynamic>>? secondaryUserDocReference;

abstract class BaseAuth {
  Future<User> signIn({required String email, required String password});

  User? getCurrentUser();

  Future<void> signOut();

  Future<void> changePassword({required String email});
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  @override
  Future<void> changePassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      showSimpleNotification(
          const Text(
              'We have sent you email to recover password, please check email.'),
          background: kcextra9);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(const Text('No user found for that email.'),
            background: kcextra9);
        print('No user found for that email.');
      } else {
        showSimpleNotification(const Text('Something went wrong'),
            background: kcextra9);
      }
    }
  }

  @override
  User? getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      userDocReference =
          FirebaseFirestore.instance.collection("students").doc(user.uid);
      // secondaryUserDocReference = FirebaseFirestore.instance
      //     .collection("secondaryUsersU")
      //     .doc(user.uid);
    }
    return user;
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(const Text('No user found for that email.'),
            background: kcextra9);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSimpleNotification(const Text('Wrong password provided.'),
            background: kcextra9);
        print('Wrong password provided.');
      } else {
        showSimpleNotification(const Text('Something went wrong'),
            background: kcextra9);
      }
    }

    return user!;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
