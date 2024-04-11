import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:step_in_style/core/repository/auth_repository.dart';
import 'package:step_in_style/models/users_model.dart';

import '../repository/firestore_repo.dart';
import '../utility/shared_prefs.dart';

part 'auth_provider.g.dart';

@riverpod
FirebaseAuth auth(AuthRef ref) => FirebaseAuth.instance;

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(ref.watch(authProvider));

@riverpod
FirestoreRepo firestoreRepo(FirestoreRepoRef ref) =>
    FirestoreRepo(ref.watch(firestoreProvider));

@riverpod
Stream<User?> authState(AuthStateRef ref) =>
    ref.watch(authRepositoryProvider).authStateChanges;

@riverpod
Future<UsersModel?> signInWithPassword(
    SignInWithPasswordRef ref, String email, String password) async {
  final data = await ref
      .read(authRepositoryProvider)
      .signInWithEmailAndPassword(email, password);
  return ref.watch(firestoreRepoProvider).getUser(data?.uid ?? '');
}

@riverpod
Future<UsersModel?> createAccountWithPassword(
  CreateAccountWithPasswordRef ref, {
  required String fullName,
  required String email,
  required String password,
}) async {
  final data = await ref
      .read(authRepositoryProvider)
      .signUpWithEmailAndPassword(email, password);
  UsersModel user = UsersModel(
    fullName: fullName,
    email: email,
    country: '',
    id: data!.uid,
  );
  return ref.watch(firestoreRepoProvider).createUser(user);
}

@riverpod
Future<UsersModel?> verifyEmail(VerifyEmailRef ref, UsersModel data) async {
  log('Providers: $data');
  UsersModel user = UsersModel(
    fullName: data.fullName,
    email: data.email,
    country: data.country,
    id: data.id,
    isVerified: true,
  );
  return ref.watch(firestoreRepoProvider).updateUser(user);
}

@riverpod
Future<UsersModel?> signInWithGoogle(SignInWithGoogleRef ref) {
  return ref.read(authRepositoryProvider).signInWithGoogle().then((creds) {
    return ref
        .watch(firestoreRepoProvider)
        .getUser(creds?.uid ?? '')
        .then((value) {
      if (value == null) {
        UsersModel user = UsersModel(
          fullName: creds?.displayName,
          email: creds?.email,
          country: '',
          id: creds?.uid,
        );
        return ref.watch(firestoreRepoProvider).createUser(user);
      }
      return value;
    });
  });
}

@riverpod
Future<void> sendRecoveryEmail(SendRecoveryEmailRef ref, String email) =>
    ref.read(authRepositoryProvider).sendRecoveryEmail(email);

@riverpod
Future<void> signOut(SignOutRef ref) =>
    ref.watch(authRepositoryProvider).signOut();
