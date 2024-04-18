import 'package:flutter/material.dart';

class FirebaseAuthSnackBars {
  /// snack bars for sign up
  static void weakPasswordSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Weak Password'),
      ),
    );
  }

  static void emailAlreadyInUseSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('The account already exists for that email'),
      ),
    );
  }


  /// snack bars for login

  // snack bar about successful login
  static void successfulLoginSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Successfully'),
      ),
    );
  }

// snack bar about General Error
  static void generalErrorSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

// snack bar about wrong password
  static void wrongPasswordSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wrong Password, please try again'),
      ),
    );
  }

// snack bar about disabled user
  static void disabledUserSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('This user is disabled temporarily \nplease try again later'),
      ),
    );
  }

// snack bar about unfounded user
  static void unfoundedUserSnackBar({required BuildContext context}) {
    debugPrint('unfounded user ==');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Could not find user, please try again'),
    ));
  }
}
