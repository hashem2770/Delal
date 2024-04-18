import 'dart:developer';
import 'package:dalel/core/error/handle_firebase_error/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleFirebaseSignUpException(
    {required FirebaseAuthException error, required BuildContext context}) {
  switch (error.code) {
    case 'weak-password':
      return FirebaseAuthSnackBars.weakPasswordSnackBar(context: context);
    case "email-already-in-use":
      return FirebaseAuthSnackBars.emailAlreadyInUseSnackBar(context: context);
  }
}

void handleFirebaseLoginException(
    {required FirebaseAuthException error, required BuildContext context}) {
  log('== context mounted ====');
  switch (error.code) {
    case 'wrong-password':
      return FirebaseAuthSnackBars.wrongPasswordSnackBar(context: context);
    case "user-not-found":
      return FirebaseAuthSnackBars.unfoundedUserSnackBar(context: context);
    case "user-disabled":
      return FirebaseAuthSnackBars.disabledUserSnackBar(context: context);
    case "operation-not-allowed":
      return FirebaseAuthSnackBars.generalErrorSnackBar(
          message: 'Too Many Requests, try later', context: context);
    case "invalid-email":
      return FirebaseAuthSnackBars.generalErrorSnackBar(
          message: 'invalid E-mail', context: context);
    default:
      var errorMessage = error.code;
      log('$errorMessage====');
      return FirebaseAuthSnackBars.generalErrorSnackBar(
          message: 'Something went wrong, try again', context: context);
  }
}
