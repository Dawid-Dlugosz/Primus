import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/author_name/data/repository/author_name_repository_impl.dart';

void main() {
  late AuthorNameRepositoryImpl repositoryImpl;
  late FakeFirebaseFirestore firestore;

  setUp(
    () {
      firestore = FakeFirebaseFirestore();
      repositoryImpl = AuthorNameRepositoryImpl(firestore: firestore);
    },
  );
  const tUid = 'uid';
  const tNickname = 'nickname';
  group(
    'AuthorNameRepositoryImpl',
    () {
      group(
        'getAuthorName',
        () {
          test(
            'should return left when firebase not have nickName in user document',
            () async {
              await firestore
                  .collection(FirebaseCollection.users.name)
                  .doc(tUid)
                  .set({'test': 'test'});

              final result = await repositoryImpl.getAuthorName(uid: tUid);

              expect(result, const Left(Failure.user()));
            },
          );

          test(
            'should return right with name when firebase have user document with nickname',
            () async {
              await firestore
                  .collection(FirebaseCollection.users.name)
                  .doc(tUid)
                  .set({'nickname': tNickname});

              final result = await repositoryImpl.getAuthorName(uid: tUid);

              expect(result, const Right(tNickname));
            },
          );
        },
      );
    },
  );
}
