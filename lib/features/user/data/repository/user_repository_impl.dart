// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/user/domain/repository/user_repository.dart';
import 'package:primus/features/user/domain/entity/user.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;
  final Logger logger = Logger();

  @override
  Future<Either<Failure, User>> addFlashcardSetToUser({
    required String flashcardSetId,
    required User user,
  }) async {
    try {
      final ownFlashcard = <String>[...user.ownFlashcard, flashcardSetId];
      final newUser = user.copyWith(ownFlashcard: ownFlashcard);
      await firestore
          .collection(FirebaseCollection.users.name)
          .doc(user.uid)
          .set(newUser.toJson());

      return Right(user);
    } catch (e, s) {
      logger.f(
        'UserRepositoryImp addFlashcardSetToUser',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.user());
    }
  }

  @override
  Future<Either<Failure, User>> createUser({
    required String nickname,
    required String uid,
  }) async {
    try {
      final user = User(
        nickname: nickname,
        uid: uid,
        ownFlashcard: [],
        toLearn: [],
      );
      await firestore
          .collection(FirebaseCollection.users.name)
          .doc(uid)
          .set(user.toJson());
      return Right(user);
    } catch (e, s) {
      logger.f('UserRepositoryImp userCreate', error: e, stackTrace: s);
      return const Left(Failure.user());
    }
  }
}
