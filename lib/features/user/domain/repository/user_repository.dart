import 'package:fpdart/fpdart.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/domain/entity/user.dart';

import '../../../../core/failure.dart';
import '../../../create_flashcard/domain/entity/flashcard_set.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> createUser({
    required String nickname,
    required String uid,
  });

  Future<Either<Failure, User>> addFlashcardSetToUser({
    required String flashcardSetId,
    required User user,
  });

  Future<Either<Failure, User>> deleteFlashcardSet({
    required String flashcardSetId,
    required User user,
  });

  Future<Either<Failure, User>> copyFlashcradSet({
    required FlashcardSet flashcardSet,
    required User user,
  });

  Future<Either<Failure, User>> getUser({required String uid});

  Future<Either<Failure, User>> deleteToLearn({
    required String flashcardSetId,
    required User user,
  });

  Future<Either<Failure, User>> updateToLearn({
    required String uid,
    required ToLearn toLearn,
    required User user,
  });
}
