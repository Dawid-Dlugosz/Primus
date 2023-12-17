import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primus/features/search/data/repository/search_repository_impl.dart';
import 'package:primus/features/search/domain/repository/search_repository.dart';

void main() {
  late SearchRepository repository;
  late FakeFirebaseFirestore firestore;

  setUp(
    () {
      firestore = FakeFirebaseFirestore();
      repository = SearchRepositoryImpl(firestore: firestore);
    },
  );

  group(
    'SearchRepository',
    () {
      group(
        'searchFlashcard',
        () {
          test(
            'Should return right with snapshots from repo',
            () async {
              final result = await repository.getSnapshot();

              expect(result.toNullable(),
                  isA<Stream<QuerySnapshot<Map<String, dynamic>>>>());
            },
          );
        },
      );
    },
  );
}
