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
                'flashCard': {
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
                  'flashCards/test',
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
                'flashCard': {
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
                  'flashCard/test',
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
        'setEditFlashcardSet function',
        () {
          test(
            'should return Failure.flashcard if firebase return empty data',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({});

              final result = await repositoryImpl.setupEditFlashcardSet(
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

              final result = await repositoryImpl.setupEditFlashcardSet(
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

              final result = await repositoryImpl.setupEditFlashcardSet(
                flashcardId: tFlashcardId,
              );
              expect(result.toNullable(), isA<FlashcardSet>());
            },
          );
        },
      );

      group(
        'checkExistingNameFlashcardSet function',
        () {
          test(
            'Should return Left when flashcardSet object from firebase is correct',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({'test': 'test', 'ownerId': tUid});

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Left(Failure.flashcard()));
            },
          );

          test(
            'Should return true when flashcardSet object from firebase is empty',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set({'test': 'test', 'ownerId': 'test'});

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(true));
            },
          );

          test(
            'Should return true when flashcardSet object from firebase have the same id and the same name as flashcardSet object',
            () async {
              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(tFlashcardSet.toJson());

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(true));
            },
          );

          test(
            'Should return true when flashcardSet object from firebase have the same id and the diferent name as flashcardSet object',
            () async {
              final newFlashcard = tFlashcardSet.flashCard.copyWith(
                nameSet: 'other',
              );

              final newFlashcardSet = tFlashcardSet.copyWith(
                flashCard: newFlashcard,
              );

              firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(newFlashcardSet.toJson());

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(true));
            },
          );

          test(
            'Should return true when flashcardSet object from firebase have the diferent id and the diferent name as flashcardSet object',
            () async {
              final newFlashcard = tFlashcardSet.flashCard.copyWith(
                nameSet: 'other',
                id: 'diferent',
              );

              final newFlashcardSet = tFlashcardSet.copyWith(
                flashCard: newFlashcard,
              );

              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(newFlashcardSet.toJson());

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(true));
            },
          );

          test(
            'Should return false when flashcardSet object from firebase have the diferent id and the same name as flashcardSet object',
            () async {
              final newFlashcard = tFlashcardSet.flashCard.copyWith(
                id: 'diferent',
              );

              final newFlashcardSet = tFlashcardSet.copyWith(
                flashCard: newFlashcard,
              );

              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(newFlashcardSet.toJson());

              final result = await repositoryImpl.checkExistingNameFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(false));
            },
          );
        },
      );

      group(
        'editFlashcardSet function',
        () {
          test(
            'Should return Left FlashCardNameBusy when checkExistingNameFlashcardSet return Right but false',
            () async {
              final newFlashcard = tFlashcardSet.flashCard.copyWith(
                id: 'diferent',
              );

              final newFlashcardSet = tFlashcardSet.copyWith(
                flashCard: newFlashcard,
              );

              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(newFlashcardSet.toJson());

              final result = await repositoryImpl.editFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Left(Failure.flashcardNameBuse()));
            },
          );

          test(
            'Should return Left Flashcard when checkExistingNameFlashcardSet return Left',
            () async {
              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(
                {'test': 'test', 'ownerId': tUid},
              );

              final result = await repositoryImpl.editFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Left(Failure.flashcard()));
            },
          );

          test(
            'Should return Right  when checkExistingNameFlashcardSet return Right',
            () async {
              await firestore
                  .collection(FirebaseCollection.flashcardSet.name)
                  .doc(tFlashcardId)
                  .set(tFlashcardSet.toJson());

              final result = await repositoryImpl.editFlashcardSet(
                flashcardSet: tFlashcardSet,
                uid: tUid,
              );

              expect(result, const Right(unit));
            },
          );
        },
      );
    },
  );
}
