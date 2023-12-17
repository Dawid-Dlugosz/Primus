// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/src/either.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/search/domain/repository/search_repository.dart';
import 'package:logger/logger.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;
  final Logger logger = Logger();

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getSnapshot() async {
    try {
      final snapshots = firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .snapshots();
      return Right(snapshots);
    } catch (e, s) {
      logger.f('SearchRepositoryImpl searchFlashcard', error: e, stackTrace: s);
      return const Left(Failure.search());
    }
  }
}
