import 'package:fpdart/fpdart.dart';

import '../../../../core/failure.dart';

abstract class AuthorNameRepository {
  Future<Either<Failure, String>> getAuthorName({required String uid});
}
