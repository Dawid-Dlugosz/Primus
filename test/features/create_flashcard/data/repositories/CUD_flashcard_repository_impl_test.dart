// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/data/repository/create_flash_card_repository_impl.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';

void main() {
  late FlashCardRepositoryImpl repositoryImpl;
  late FakeFirebaseFirestore firestore;

  setUpAll(
    () {
      firestore = FakeFirebaseFirestore();
      repositoryImpl = FlashCardRepositoryImpl(
        firestore: firestore,
        authUserId: 'userTest',
      );
    },
  );
  final tSmallWords = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final tBigWords = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  const tFlashcardId = 'flashcardId';

  const tFlashcardSet = FlashcardSet(
    flashCard: FlashCard(
      id: tFlashcardId,
      languageSet: 'English',
      nameSet: 'test',
      words: [],
      timeStamp: 1701022109526,
    ),
    ownerId: '1222,',
  );

  group(
    'createFlashcardRepositoryImpl',
    () {
      group('createFlashcardSet function', () {
        test(
          'should return left toShort Failure when words TextEditingController is small than 4',
          () async {
            final result = await repositoryImpl.createFlashcardSet(
              name: '',
              language: '',
              words: tSmallWords,
              definitions: tSmallWords,
            );

            expect(result, const Left(Failure.tooShort()));
          },
        );

        test(
          'should return left flashcardNameBusy Failure when name is busy',
          () async {
            final collection =
                firestore.collection(FirebaseCollection.flashcardSet.name);
            final doc = collection.doc('test');
            await doc.set(
              {
                'flashcard': {
                  'nameSet': 'name',
                },
              },
            );

            final userCollection =
                firestore.collection(FirebaseCollection.users.name);

            final userDoc = userCollection.doc('userTest');
            await userDoc.set(
              {
                'ownFlashcard': [
                  'test',
                ]
              },
            );

            final result = await repositoryImpl.createFlashcardSet(
              name: 'name',
              language: '',
              words: tBigWords,
              definitions: tBigWords,
            );

            expect(result, const Left(Failure.flashcardNameBuse()));
          },
        );

        test(
          'should return Right flashcardSet id when user ownflashcard is empty',
          () async {
            final collection =
                firestore.collection(FirebaseCollection.flashcardSet.name);
            final doc = collection.doc('test');
            await doc.set(
              {
                'flashcard': {
                  'nameSet': 'name',
                },
              },
            );

            final userCollection =
                firestore.collection(FirebaseCollection.users.name);

            final userDoc = userCollection.doc('userTest');
            await userDoc.set(
              {'ownFlashcard': []},
            );

            final result = await repositoryImpl.createFlashcardSet(
              name: 'name',
              language: '',
              words: tBigWords,
              definitions: tBigWords,
            );

            expect(result.toOption().toNullable(), isA<String>());
          },
        );

        test(
          'should return Right flashcardSet id when flashcard name is not busy',
          () async {
            final collection =
                firestore.collection(FirebaseCollection.flashcardSet.name);
            final doc = collection.doc('test');
            await doc.set(
              {
                'flashcard': {
                  'nameSet': 'name',
                },
              },
            );

            final userCollection =
                firestore.collection(FirebaseCollection.users.name);

            final userDoc = userCollection.doc('userTest');
            await userDoc.set(
              {
                'ownFlashcard': [
                  'test',
                ],
              },
            );

            final result = await repositoryImpl.createFlashcardSet(
              name: 'name2',
              language: '',
              words: tBigWords,
              definitions: tBigWords,
            );

            expect(result.toOption().toNullable(), isA<String>());
          },
        );
      });

      group('deleteFlashcardSet function', () {
        test(
          'should return unit if delete flashcard ',
          () async {
            final result = await repositoryImpl.deleteFlashcardSet(
              flashcardId: tFlashcardId,
            );

            expect(result, const Right(unit));
          },
        );
      });

      group(
        'EditFlashcardSet function',
        () {
          test(
            'should return Failure.flashcard if firebase return empty data',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({});

              final result = await repositoryImpl.editFlashcardSet(
                flashcardId: tFlashcardId,
              );

              expect(result, const Left(Failure.flashcard()));
            },
          );

          test(
            'should return Failure.flashcard if firebase return wrong object',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({
                'test': 123,
              });

              final result = await repositoryImpl.editFlashcardSet(
                flashcardId: tFlashcardId,
              );

              expect(result, const Left(Failure.flashcard()));
            },
          );

          test(
            'should return flashcardSet if firebase return right object',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(
                {
                  'flashCard': {
                    'id': tFlashcardId,
                    'languageSet': 'English',
                    'nameSet': 'test',
                    'timeStamp': 1701022109526,
                    'words': [],
                  },
                  'ownerId': '1222',
                },
              );

              final result = await repositoryImpl.editFlashcardSet(
                flashcardId: tFlashcardId,
              );

              // expect(result, const Right(tFlashcardSet));
              expect(result.toNullable(), isA<FlashcardSet>());
            },
          );
        },
      );
    },
  );
}
