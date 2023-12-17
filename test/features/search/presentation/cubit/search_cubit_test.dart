import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/search/domain/repository/search_repository.dart';
import 'package:primus/features/search/presentation/search/search_cubit.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late MockSearchRepository repository;
  late SearchCubit cubit;
  late FakeFirebaseFirestore firestore;
  setUp(
    () {
      firestore = FakeFirebaseFirestore();
      repository = MockSearchRepository();
      cubit = SearchCubit(repository: repository);
    },
  );
  const tFlashcardId = 'flashcardId';
  const tUid = '1222';

  const tFlashcardSet = FlashcardSet(
    flashCard: FlashCard(
      id: tFlashcardId,
      languageSet: 'English',
      nameSet: 'test',
      words: [],
      timeStamp: 1701022109526,
    ),
    ownerId: tUid,
  );

  group(
    'SearchCubit',
    () {
      group(
        'loadFlashcardSets',
        () {
          test(
            'Should emit empty list as a first state ',
            () {
              expect(cubit.state, []);
            },
          );

          blocTest(
            'should emit [[]]  when firestore return empty docs',
            build: () => cubit,
            act: (_) {
              final snapshot = firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .snapshots();
              when(() => repository.getSnapshot())
                  .thenAnswer((_) async => Right(snapshot));

              cubit.searchFlashcard(name: '');
            },
            expect: () => [[]],
          );

          blocTest(
            'should emit [List of FlashcardSet]  when firestore return dosc and flashcard.name contains name',
            build: () => cubit,
            act: (_) {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(tFlashcardSet.toJson());

              final snapshot = firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .snapshots();

              when(() => repository.getSnapshot())
                  .thenAnswer((_) async => Right(snapshot));

              cubit.searchFlashcard(name: 'test');
            },
            expect: () => [
              [tFlashcardSet]
            ],
          );

          blocTest(
            'should emit [[]]  when firestore return dosc and flashcard.name not contains name',
            build: () => cubit,
            act: (_) {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(tFlashcardSet.toJson());

              final snapshot = firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .snapshots();

              when(() => repository.getSnapshot())
                  .thenAnswer((_) async => Right(snapshot));

              cubit.searchFlashcard(name: '2');
            },
            expect: () => [[]],
          );

          blocTest(
            'should emit [[]]  when firestore return dosc return wrong object',
            build: () => cubit,
            act: (_) {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({'test': 'test'});

              final snapshot = firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .snapshots();

              when(() => repository.getSnapshot())
                  .thenAnswer((_) async => Right(snapshot));

              cubit.searchFlashcard(name: '2');
            },
            expect: () => [[]],
          );
        },
      );
    },
  );
}
