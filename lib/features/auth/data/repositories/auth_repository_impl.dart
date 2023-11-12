import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/exception/busy_nickname.dart';
import 'package:primus/features/auth/utils/firebase_error.dart';
import '../../../../enum/collection.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  @override
  Future<Either<String, UserCredential>> createAccount({
    required String email,
    required String password,
    required String nickname,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<Either<String, UserCredential>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<Either<String, Unit>> resetPassword({required String email}) async {
    try {
      firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<Either<String, Unit>> checkNickname({required String nickname}) async {
    try {
      final document =
          await firestore.collection(FirebaseCollection.users.name).get();

      for (var element in document.docs) {
        var user = element.data();
        if (user['nickname'] == nickname) {
          throw BusyNickname();
        }
      }
      return const Right(unit);
    } on BusyNickname catch (_) {
      return const Left(nicknameBusy);
    }
  }

  @override
  Stream<User?> isUserLoggin() async* {
    yield* firebaseAuth.authStateChanges();
  }
}
