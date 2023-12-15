import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';

import '../../../../core/failure.dart';

abstract class FlashcardRepository {
  /// Add flashcardSet to database and return path to created set
  Future<Either<Failure, String>> createFlashcardSet({
    required String name,
    required String language,
    required List<TextEditingController> words,
    required List<TextEditingController> definitions,
  });

  Future<Either<Failure, Unit>> deleteFlashcardSet({
    required String flashcardId,
  });

  Future<Either<Failure, FlashcardSet>> editFlashcardSet({
    required String flashcardId,
  });
}
