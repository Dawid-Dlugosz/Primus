import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/vocabulary/data/repository/vocabulary_repository_impl.dart';
import 'package:primus/model/word.dart';

void main() {
  late VocabularyRepositoryImpl repository;
  late FakeFirebaseFirestore firestore;

  setUp(
    () {
      firestore = FakeFirebaseFirestore();
      repository = VocabularyRepositoryImpl(firestore: firestore);
    },
  );
  const tFlashcardSetId = 'id';

  final tWords = [
    Word(
      word: '1',
      definition: '1d',
      id: '1i',
    ),
    Word(
      word: '2',
      definition: '2d',
      id: '2i',
    ),
  ];
  group(
    'VocabularyRepositoryImpl',
    () {
      group(
        'getWords',
        () {
          test(
            'should return Failure when firestore doc not have words field',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardSetId)
                  .set({'test': 'test'});

              final result =
                  await repository.getWords(flashcardSetId: tFlashcardSetId);

              expect(result, const Left(Failure.word()));
            },
          );

          test(
            'should return empty list when firestore doc not have empty words field',
            () async {
              final words = <Word>[];

              // final x = words.map((e) => e.toJson()).toList();
              // print(x);
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardSetId)
                  .set(
                {
                  'flashCard': {
                    'words': [],
                  },
                },
              );

              final result =
                  await repository.getWords(flashcardSetId: tFlashcardSetId);

              expect(result.toNullable(), words);
            },
          );

          test(
            'should return Failure when not firestore doc have words field but wrong json',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardSetId)
                  .set(
                {
                  'flashCard': {
                    'words': [
                      {'test': 'test'}
                    ]
                  }
                },
              );

              final result =
                  await repository.getWords(flashcardSetId: tFlashcardSetId);

              expect(result, const Left(Failure.word()));
            },
          );

          test(
            'should return words List when not firestore doc have words field',
            () async {
              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardSetId)
                  .set(
                {
                  'flashCard': {
                    'words': tWords.map((e) => e.toJson()).toList(),
                  }
                },
              );

              final result =
                  await repository.getWords(flashcardSetId: tFlashcardSetId);
              expect(result.toNullable()?.length, 2);
            },
          );
        },
      );
    },
  );
}
