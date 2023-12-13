import 'package:fpdart/fpdart.dart';
import 'package:primus/features/user/domain/entity/user.dart';

import '../../../../core/failure.dart';

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
}
