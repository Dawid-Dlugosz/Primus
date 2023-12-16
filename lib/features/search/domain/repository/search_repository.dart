import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<FlashcardSet>>> searchFlashcard({
    required String name,
  });
}
