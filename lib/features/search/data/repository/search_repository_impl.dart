// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/src/either.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/search/domain/repository/search_repository.dart';
import 'package:logger/logger.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;

  final Logger logger;
  @override
  Future<Either<Failure, List<FlashcardSet>>> searchFlashcard(
      {required String name}) async {
    try {
      firestore
    } catch (e, s) {
      logger.f('SearchRepositoryImpl searchFlashcard', error: e, stackTrace: s);
      return const Left(Failure.search());
    }
  }
}
