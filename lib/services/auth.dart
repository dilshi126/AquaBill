import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/models/UserModel.dart';

class AuthServices {
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
  try {
  UserCredential result = await _auth.createUserWithEmailAndPassword(
  email: email,
  password: password,
  );
  User? user = result.user;
  return user; // return user information if registration is successful
  } catch (e) {
  print(e.toString());
  return null; // return null if registration fails
  }
  }


  // Create a user from Firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Create a stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // Sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Register using email and password and send verification email
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Send verification email
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in using email and password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Check if email is verified
      if (user != null && !user.emailVerified) {
        return "Email not verified";
      }

      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Check email verification status
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload();  // Refresh user data
    return user?.emailVerified ?? false;
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
