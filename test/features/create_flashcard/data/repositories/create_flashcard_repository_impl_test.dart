import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/create_flashcard/data/repository/create_flash_card_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late CreateFlashCardRepositoryImpl repositoryImpl;
  late FakeFirebaseFirestore firestore;

  setUpAll(
    () {
      firestore = FakeFirebaseFirestore();
      repositoryImpl = CreateFlashCardRepositoryImpl(
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

  group(
    'createFlashcardRepositoryImpl',
    () {
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
    },
  );
}
