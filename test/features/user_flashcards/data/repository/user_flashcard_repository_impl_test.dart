import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/user_flashcard/data/repository/user_flashcard_repository_impl.dart';
import 'package:primus/features/user_flashcard/domain/repository/user_flashcard_repository.dart';

void main() {
  late FakeFirebaseFirestore firestore;
  late UserFlashcardRepository repository;

  setUp(
    () {
      firestore = FakeFirebaseFirestore();
      repository = UserFlashcardRepositoryImpl(firestore: firestore);
    },
  );
  const tUid = "uid";
  group(
    'UserFlashcardRepositoryImpl',
    () {
      test(
        'should return snapshot of Stream<QuerySnapshot>',
        () async {
          final result = await repository.streamFlashcardSet(uid: tUid);

          expect(result.toOption().toNullable(),
              isA<Stream<QuerySnapshot<Map<String, dynamic>>>>());
        },
      );

      test(
        'should return snapshot with two documents',
        () async {
          final collection =
              firestore.collection(FirebaseCollection.flashcardSet.name);
          final doc = collection.doc('test');
          final doc2 = collection.doc('test2');
          await doc.set(
            {
              'ownerId': 'uid',
            },
          );
          await doc2.set(
            {
              'ownerId': 'uid',
            },
          );

          final result = await repository.streamFlashcardSet(uid: tUid);

          final stream = result.toOption().toNullable()!;
          stream.listen((event) {
            final length = event.docs.length;

            expect(length, 2);
          });
        },
      );
      test(
        'should return snapshot with empty documents',
        () async {
          final collection =
              firestore.collection(FirebaseCollection.flashcardSet.name);
          final doc = collection.doc('test');
          final doc2 = collection.doc('test2');
          await doc.set(
            {
              'ownerId': 'uid2',
            },
          );
          await doc2.set(
            {
              'ownerId': 'uid2',
            },
          );

          final result = await repository.streamFlashcardSet(uid: tUid);

          final stream = result.toOption().toNullable()!;
          stream.listen((event) {
            final length = event.docs.length;

            expect(length, 0);
          });
        },
      );
    },
  );
}
