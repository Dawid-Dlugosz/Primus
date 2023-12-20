// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';
import 'package:primus/features/vocabulary/domain/repository/vocabulary_repository.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  VocabularyRepositoryImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;
  final Logger logger = Logger();

  @override
  Future<Either<Failure, List<Word>>> getWords({
    required String flashcardSetId,
  }) async {
    try {
      final words = <Word>[];
      final document = await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(flashcardSetId)
          .get();
      final data = document.get('words');
      for (var value in (data as List<dynamic>)) {
        words.add(Word.fromJson(value));
      }

      return Right(words);
    } catch (e, s) {
      logger.f(
        'VocabularyRepositoryImpl getWords',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.word());
    }
  }
}
