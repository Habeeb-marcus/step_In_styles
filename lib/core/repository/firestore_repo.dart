import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/users_model.dart';
import '../exceptions/auth_exception.dart';
import '../utility/constants.dart';

class FirestoreRepo {
  final FirebaseFirestore firestore;
  FirestoreRepo(this.firestore);
  CollectionReference usersCollection() =>
      firestore.collection(Constants.kUsers);

  Future<UsersModel> createUser(UsersModel user) async {
    // UsersModel user = UsersModel.defaultValue();
    try {
      await usersCollection()
          .withConverter(
              fromFirestore: (snap, _) => UsersModel.fromJson(snap.data()!),
              toFirestore: (user, _) => user.toJson())
          .doc(user.id)
          .set(user);
      return user;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Future<UsersModel?> getUser(String uid) async {
    try {
      final docRef = usersCollection()
          .withConverter(
              fromFirestore: (snap, _) => UsersModel.fromJson(snap.data()!),
              toFirestore: (user, _) => user.toJson())
          .doc(uid);
      final result = await docRef.get();
      if (result.data() == null) {
        // throw AuthException('Creation of user not successful');
        return null;
      }
      return result.data()!;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }

  Future<UsersModel> updateUser(UsersModel user) async {
    // UsersModel user = UsersModel.defaultValue();
    try {
      await usersCollection()
          .withConverter(
              fromFirestore: (snap, _) => UsersModel.fromJson(snap.data()!),
              toFirestore: (user, _) => user.toJson())
          .doc(user.id)
          .update({'isVerified': true});
      return user;
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      throw AuthException(AuthException.getMessageFromErrorCode(e.code));
    } catch (e) {
      log(e.toString());
      throw AuthException('Something went wrong!');
    }
  }
}
