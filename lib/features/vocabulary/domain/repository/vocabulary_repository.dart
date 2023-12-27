import 'package:fpdart/fpdart.dart';

import '../../../../core/failure.dart';
import '../../../create_flashcard/domain/entity/word.dart';

abstract class VocabularyRepository {
  Future<Either<Failure, List<Word>>> getWords({
    required String flashcardSetId,
  });
}
