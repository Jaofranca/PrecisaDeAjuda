import 'package:firebase_auth/firebase_auth.dart';

String returnFirebaseError(FirebaseAuthException e) {
  if (e.code == 'weak-password') {
    return 'The password provided is too weak.';
  }
  if (e.code == 'email-already-in-use') {
    return 'The account already exists for that email.';
  }
  if (e.code == 'invalid-password') {
    return 'The password provided is too weak.';
  }
  if (e.code == 'invalid-email') {
    return 'The email provided doesnt exist.';
  }
  if (e.code == 'email-already-exists') {
    return 'The account already exists for that email.';
  }
  return e.code;
}
