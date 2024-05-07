// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/core/enum/collection.dart';
import 'package:primus/features/user_flashcard/domain/repository/user_flashcard_repository.dart';

class UserFlashcardRepositoryImpl implements UserFlashcardRepository {
  UserFlashcardRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;
  final Logger logger = Logger();
  @override
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      streamFlashcardSet({
    required String uid,
  }) async {
    try {
      final snapshot = firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .where('ownerId', isEqualTo: uid)
          .snapshots();

      return Right(snapshot);
    } catch (e, s) {
      logger.f(
        'UserflashcardRepositoryImpl streamFlashcardSet',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.flashcard());
    }
  }
}
