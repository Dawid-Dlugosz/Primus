import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fpdart/fpdart.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/user/domain/entity/learn_method.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/domain/entity/to_learn_word.dart';
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

      return Right(newUser);
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

  @override
  Future<Either<Failure, User>> deleteFlashcardSet({
    required String flashcardSetId,
    required User user,
  }) async {
    try {
      final newOwnFlashcard = user.ownFlashcard
          .where((element) => !element.contains(flashcardSetId));

      await firestore
          .collection(FirebaseCollection.users.name)
          .doc(user.uid)
          .update({'ownFlashcard': newOwnFlashcard.toList()});

      return Right(user.copyWith(ownFlashcard: newOwnFlashcard.toList()));
    } catch (e, s) {
      logger.f('UserRepositoryImp deleteFlashcardSet', error: e, stackTrace: s);
      return const Left(Failure.user());
    }
  }

  @override
  Future<Either<Failure, User>> copyFlashcradSet({
    required FlashcardSet flashcardSet,
    required User user,
  }) async {
    try {
      final newToLearns = [...user.toLearn];
      const learnMethod = LearnMethod(
        flashcard: false,
        spelling: false,
        test: false,
      );

      final toLearn = ToLearn(
        flashcardId: flashcardSet.flashCard.id,
        words: flashcardSet.flashCard.words
            .map(
              (e) => ToLearnWord(
                learnMethod: learnMethod,
                word: e,
              ),
            )
            .toList(),
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      );

      newToLearns.add(toLearn);
      final newUser = user.copyWith(toLearn: newToLearns);

      await firestore
          .collection(FirebaseCollection.users.name)
          .doc(user.uid)
          .update(
        {
          'toLearn': newToLearns.map((e) => e.toJson()).toList(),
        },
      );
      return Right(newUser);
    } catch (e, s) {
      logger.f(
        'UserRepository copuFlashcardSet',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.user());
    }
  }
}
