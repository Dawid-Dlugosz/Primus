import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/failure.dart';

abstract class CreateFlashcardRepository {
  /// Add flashcardSet to database and return path to created set
  Future<Either<Failure, String>> createFlashcardSet({
    required String name,
    required String language,
    required List<TextEditingController> words,
    required List<TextEditingController> definitions,
  });
}
