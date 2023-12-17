// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';

import '../../domain/repository/author_name_repository.dart';

class AuthorNameRepositoryImpl implements AuthorNameRepository {
  AuthorNameRepositoryImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;
  final Logger logger = Logger();
  @override
  Future<Either<Failure, String>> getAuthorName({required String uid}) async {
    try {
      final document = await firestore
          .collection(FirebaseCollection.users.name)
          .doc(uid)
          .get();
      final nickname = document.get('nickname');
      if (nickname == null) {
        throw Exception();
      }
      return Right(nickname.toString());
    } catch (e, s) {
      logger.f(
        'AuthorNameRepositoryImpl getAuthorName',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.user());
    }
  }
}
