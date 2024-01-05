import 'package:fpdart/fpdart.dart';
import 'package:primus/features/user/domain/entity/learn_method.dart';

import '../../../core/failure.dart';

abstract class ToLearnRepository {
  Future<Either<Failure, String>> getSetName({required String flashcardSetId});

  Future<Either<Failure, Unit>> deleteToLearn({required String flashcardSetId});

  Future<Either<Failure, LearnMethod>> setLearnMethod({
    required bool flashcard,
    required bool spelling,
    required bool test,
  });
}
