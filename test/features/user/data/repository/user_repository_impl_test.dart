import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';
import 'package:primus/features/user/data/repository/user_repository_impl.dart';
import 'package:primus/features/user/domain/entity/learn_method.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/domain/entity/to_learn_word.dart';
import 'package:primus/features/user/domain/entity/user.dart';
import 'package:primus/features/user/domain/repository/user_repository.dart';

void main() {
  late FakeFirebaseFirestore firestore;
  late UserRepository repository;

  setUp(() {
    firestore = FakeFirebaseFirestore();
    repository = UserRepositoryImpl(firestore: firestore);
  });

  final timeStamp = DateTime(2023, 1, 1).millisecondsSinceEpoch;

  const user = User(
    nickname: 'dawid',
    ownFlashcard: ['12-12-12'],
    toLearn: [],
    uid: '123123',
  );

  final tFlashcardSet = FlashcardSet(
    flashCard: FlashCard(
      id: '1',
      languageSet: 'english',
      nameSet: 'testName',
      timeStamp: timeStamp,
      words: [
        const Word(
          id: '1',
          word: 'word',
          definition: 'definition',
        )
      ],
    ),
    ownerId: 'ownwe-id',
  );

  final toLearn = ToLearn(
    flashcardId: '1',
    words: [
      const ToLearnWord(
        learnMethod: LearnMethod(
          flashcard: false,
          spelling: false,
          test: false,
        ),
        word: Word(
          id: '1',
          word: 'word',
          definition: 'definition',
        ),
      )
    ],
    timeStamp: timeStamp,
  );

  const tFlashcardSetId = 'asas';
  const tDeletedFlashcard = '12-12-12';
  group(
    'userRepositoryImpl',
    () {
      test(
        'return User and add collection to firebase',
        () async {
          final collection =
              firestore.collection(FirebaseCollection.users.name);
          final doc = collection.doc('user');
          final newList = [...user.ownFlashcard, tFlashcardSetId];
          await doc.set(user.copyWith(ownFlashcard: newList).toJson());

          final result = await repository.addFlashcardSetToUser(
            flashcardSetId: tFlashcardSetId,
            user: user,
          );

          expect(result.toOption().toNullable()?.ownFlashcard.length, 2);

          final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              await firestore
                  .collection(FirebaseCollection.users.name)
                  .doc('user')
                  .get();

          final Map<String, dynamic> actualData = documentSnapshot.data()!;

          final newOwnFlashcard = [...user.ownFlashcard, tFlashcardSetId];

          expect(
            actualData,
            user
                .copyWith(
                  ownFlashcard: newOwnFlashcard,
                )
                .toJson(),
          );
        },
      );

      test(
        'return User and add user to firebase',
        () async {
          final collection =
              firestore.collection(FirebaseCollection.users.name);
          final doc = collection.doc('user');

          await doc.set(user.toJson());

          final result = await repository.createUser(
            nickname: 'dawid',
            uid: '123123',
          );

          expect(result.toOption().toNullable(), isA<User>());

          final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              await firestore
                  .collection(FirebaseCollection.users.name)
                  .doc('user')
                  .get();

          final Map<String, dynamic> actualData = documentSnapshot.data()!;

          expect(
            actualData,
            user.toJson(),
          );
        },
      );

      test(
        'Should return user with new own flashcard',
        () async {
          firestore
              .collection(FirebaseCollection.users.name)
              .doc(user.uid)
              .set({
            'ownFlashcard': ['12-12-12']
          });

          final result = await repository.deleteFlashcardSet(
            flashcardSetId: tDeletedFlashcard,
            user: user,
          );

          final newUser = result.toOption().toNullable();

          expect(newUser?.ownFlashcard, []);
        },
      );

      test(
        'Should add toLearn to User',
        () async {
          await firestore
              .collection(FirebaseCollection.users.name)
              .doc(user.uid)
              .set(user.toJson());
          final failureOrUser = await repository.copyFlashcradSet(
            flashcardSet: tFlashcardSet,
            user: user,
          );

          final newUser = failureOrUser.toOption().toNullable();

          expect(newUser?.toLearn, isA<List<ToLearn>>());
          expect(newUser?.toLearn.length, 1);
        },
      );
    },
  );
}
