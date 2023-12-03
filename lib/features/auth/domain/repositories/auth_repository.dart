import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<String, UserCredential>> logIn({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<Either<String, User>> createAccount({
    required String email,
    required String password,
    required String nickname,
  });
  Future<Either<String, Unit>> resetPassword({
    required String email,
  });

  Future<Either<String, Unit>> checkNickname({required String nickname});

  Stream<User?> isUserLoggin();
}
