import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/failure.dart';

abstract class UserFlashcardRepository {
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      streamFlashcardSet({
    required String uid,
  });
}
