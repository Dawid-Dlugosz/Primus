// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/core/exception/too_short.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';
import 'package:primus/features/create_flashcard/domain/repository/create_flash_card_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:logger/logger.dart';
import '../../../../core/enum/collection.dart';
import '../../../../core/exception/flashcard_name_busy.dart';

class FlashCardRepositoryImpl extends FlashcardRepository {
  FlashCardRepositoryImpl({
    required this.firestore,
    required this.authUserId,
  });

  final FirebaseFirestore firestore;
  final String authUserId;

  final Logger logger = Logger();

  @override
  Future<Either<Failure, String>> createFlashcardSet({
    required String name,
    required String language,
    required List<TextEditingController> words,
    required List<TextEditingController> definitions,
  }) async {
    try {
      if (words.length < 4) {
        throw TooShort();
      }
      await _checkFlashCardName(name);
      final flashcardSet = _generateFlashcardSet(
        words,
        definitions,
        language,
        name,
      );

      final flashcardId = flashcardSet.flashCard.id;

      await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(flashcardId)
          .set(flashcardSet.toJson());

      final document = 'flashcardSet/$flashcardId';

      return Right(document);
    } on TooShort catch (_) {
      return const Left(Failure.tooShort());
    } on FlashCardNameBusy catch (_) {
      return const Left(Failure.flashcardNameBuse());
    } catch (e, s) {
      logger.f(
        'CreateFlashcardRepository createFlashcardSet',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.general());
    }
  }

  Future<void> _checkFlashCardName(String newNameSet) async {
    final documentSnapshot = await firestore
        .collection(FirebaseCollection.users.name)
        .doc(authUserId)
        .get();

    final documentData = documentSnapshot.data();
    if (documentData == null) {
      return;
    }

    final flashcards = documentData['ownFlashcard'] as List<dynamic>?;
    if (flashcards == null || flashcards.isEmpty) {
      return;
    }

    for (var element in flashcards) {
      final documentId = (element).split('/')[1];
      final documentSnapshot = await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(documentId)
          .get();

      final documentData = documentSnapshot.data();
      if (documentData == null) {
        return;
      }
      final nameSet = documentData['flashCard']['nameSet'];

      if (nameSet == newNameSet) {
        throw FlashCardNameBusy();
      }
    }
  }

  FlashcardSet _generateFlashcardSet(
    List<TextEditingController> wordsFields,
    List<TextEditingController> definitionsFields,
    String language,
    String name,
  ) {
    final words = <Word>[];

    wordsFields.asMap().forEach((index, element) {
      words.add(
        Word(
          id: const Uuid().v4(),
          word: element.text,
          definition: definitionsFields[index].text,
        ),
      );
    });

    final flashcard = FlashCard(
      id: const Uuid().v4(),
      languageSet: language,
      nameSet: name,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
      words: words,
    );

    final flashCardSet = FlashcardSet(
      flashCard: flashcard,
      ownerId: authUserId,
    );

    return flashCardSet;
  }

  @override
  Future<Either<Failure, Unit>> deleteFlashcardSet({
    required String flashcardId,
  }) async {
    try {
      await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(flashcardId)
          .delete();

      return const Right(unit);
    } catch (_) {
      return const Left(Failure.flashcard());
    }
  }

  @override
  Future<Either<Failure, FlashcardSet>> setupEditFlashcardSet(
      {required String flashcardId}) async {
    try {
      final result = await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(flashcardId)
          .get();

      final data = result.data();

      if (data == null) {
        return const Left(Failure.flashcard());
      }
      final flashcardSet = FlashcardSet.fromJson(data);

      return Right(flashcardSet);
    } catch (e, s) {
      logger.f(
        'CreateFlashcardRepository editFlashcardSet',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.flashcard());
    }
  }

  @override
  Future<Either<Failure, Unit>> editFlashcardSet({
    required FlashcardSet flashcardSet,
    required String uid,
  }) async {
    try {
      final result = await checkExistingNameFlashcardSet(
          flashcardSet: flashcardSet, uid: uid);
      await result.fold(
        (l) => throw (Exception()),
        (value) async {
          if (!value) {
            throw FlashCardNameBusy();
          }
          await firestore
              .collection(FirebaseCollection.flashcardSet.name)
              .doc(flashcardSet.flashCard.id)
              .set(flashcardSet.toJson());
        },
      );
      return const Right(unit);
    } on FlashCardNameBusy {
      return const Left(Failure.flashcardNameBuse());
    } catch (e, s) {
      logger.f(
        'CreateFlashcardRepository editFlashcardSet',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.flashcard());
    }
  }

  @visibleForTesting
  Future<Either<Failure, bool>> checkExistingNameFlashcardSet({
    required FlashcardSet flashcardSet,
    required uid,
  }) async {
    try {
      final result = await firestore
          .collection(FirebaseCollection.flashcardSet.name)
          .where(
            'ownerId',
            isEqualTo: uid,
          )
          .get();

      final docs = result.docs;

      for (var element in docs) {
        final data = element.data();
        final tmpFlashcardSet = FlashcardSet.fromJson(data);
        if (tmpFlashcardSet.flashCard.nameSet ==
                flashcardSet.flashCard.nameSet &&
            tmpFlashcardSet.flashCard.id == flashcardSet.flashCard.id) {
          return const Right(true);
        }

        if (tmpFlashcardSet.flashCard.nameSet ==
                flashcardSet.flashCard.nameSet &&
            tmpFlashcardSet.flashCard.id != flashcardSet.flashCard.id) {
          return const Right(false);
        }
      }

      return const Right(true);
    } catch (e, s) {
      logger.f(
        'CreateFlashCardRepository checkExistingNameFlashcardSet',
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.flashcard());
    }
  }
}
