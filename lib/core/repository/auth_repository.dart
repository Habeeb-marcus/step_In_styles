import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../exceptions/auth_exception.dart';

class AuthRepository {
  const AuthRepository(this._auth);
  final FirebaseAuth _auth;

  // what is dependency injection?
  // Dependency injection is a technique whereby one object (or static method) supplies the dependencies of another object. A dependency is an object that can be used (a service). An injection is the passing of a dependency to a dependent object (a client) that would use it.

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
        clientId:
            '69795892359-33221aftrsnnn6cnha8af0r567j1rb1d.apps.googleusercontent.com',
      ).signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      await _auth.signInWithCredential(credential);
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   throw AuthException('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   throw AuthException('Wrong password provided for that user.');
      // }
      log(e.message!);
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Future<void> sendRecoveryEmail(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // throw AuthException(AuthException.getMessageFromErrorCode(e.code));
      log(e.message!);
      throw AuthException(e.message ?? 'Something went wrong!');
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
