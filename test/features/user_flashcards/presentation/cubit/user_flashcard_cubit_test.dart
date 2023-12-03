import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';

import 'package:primus/features/user_flashcard/domain/repository/user_flashcard_repository.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';

class MockUserFlashcardRepository extends Mock
    implements UserFlashcardRepository {}

void main() {
  late MockUserFlashcardRepository repository;
  late UserFlashcardCubit cubit;
  late FakeFirebaseFirestore firestore;

  setUp(
    () {
      repository = MockUserFlashcardRepository();
      firestore = FakeFirebaseFirestore();

      cubit = UserFlashcardCubit(
        repository: repository,
      );
    },
  );
  const tUid = 'uid';
  const tFlashcard = FlashcardSet(
    flashCard: FlashCard(
      id: '1',
      languageSet: 'language',
      nameSet: 'set',
      words: [],
      timeStamp: 121211212,
    ),
    ownerId: 'uid',
  );

  const tFlashcard2 = FlashcardSet(
    flashCard: FlashCard(
      id: '1',
      languageSet: 'language',
      nameSet: 'set',
      words: [],
      timeStamp: 121211212,
    ),
    ownerId: 'uid',
  );
  group(
    'UserFlashcardCubit',
    () {
      test(
        'should emit [Initial] as a first state',
        () {
          expect(cubit.state, const UserFlashcardState.initial());
        },
      );

      blocTest(
        'should emit [Loaded] with empty list',
        build: () => cubit,
        act: (_) async {
          final snapshot = firestore
              .collection(FirebaseCollection.flashcardSet.name)
              .snapshots();

          when(() => repository.streamFlashcardSet(uid: any(named: 'uid')))
              .thenAnswer(
            (_) async => Right(snapshot),
          );

          await cubit.loadFlashcardSets(uid: tUid);
        },
        expect: () => [
          const UserFlashcardState.empty(),
        ],
      );

      blocTest(
        'should emit [Loaded] with list of two items',
        build: () => cubit,
        act: (_) async {
          final collection =
              firestore.collection(FirebaseCollection.flashcardSet.name);

          final doc = collection.doc('test');
          final doc2 = collection.doc('test2');
          await doc.set(tFlashcard.toJson());
          await doc2.set(tFlashcard2.toJson());

          final snapshot = collection.snapshots();

          when(() => repository.streamFlashcardSet(uid: any(named: 'uid')))
              .thenAnswer(
            (_) async => Right(snapshot),
          );

          await cubit.loadFlashcardSets(uid: tUid);
        },
        expect: () => [
          const UserFlashcardState.loaded(
              flashcardSets: [tFlashcard, tFlashcard2])
        ],
      );

      blocTest(
        'should emit [Empty] state when documents is emptys',
        build: () => cubit,
        act: (_) async {
          final collection =
              firestore.collection(FirebaseCollection.flashcardSet.name);

          final snapshot = collection.snapshots();

          when(() => repository.streamFlashcardSet(uid: any(named: 'uid')))
              .thenAnswer(
            (_) async => Right(snapshot),
          );

          await cubit.loadFlashcardSets(uid: 'tUid');
        },
        expect: () => [const UserFlashcardState.empty()],
      );

      blocTest(
        'should emit [Error] state when repo return left',
        build: () => cubit,
        act: (_) async {
          when(() => repository.streamFlashcardSet(uid: any(named: 'uid')))
              .thenAnswer(
            (_) async => const Left(Failure.flashcard()),
          );

          await cubit.loadFlashcardSets(uid: 'tUid');
        },
        expect: () => [const UserFlashcardState.error()],
      );
    },
  );
}
