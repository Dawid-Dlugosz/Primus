import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<String, UserCredential>> logIn({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<Either<String, UserCredential>> createAccount({
    required String email,
    required String password,
  });
  Future<Either<String, Unit>> resetPassword({
    required String email,
  });
}
