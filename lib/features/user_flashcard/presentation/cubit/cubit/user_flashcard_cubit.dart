import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/user_flashcard/domain/repository/user_flashcard_repository.dart';

import '../../../../create_flashcard/domain/entity/flashcard_set.dart';

part 'user_flashcard_state.dart';
part 'user_flashcard_cubit.freezed.dart';

class UserFlashcardCubit extends Cubit<UserFlashcardState> {
  UserFlashcardCubit({
    required this.repository,
  }) : super(const UserFlashcardState.initial());

  final UserFlashcardRepository repository;

  Future<void> loadFlashcardSets({required String uid}) async {
    final result = await repository.streamFlashcardSet(uid: uid);
    result.fold(
      (l) => emit(const UserFlashcardState.error()),
      (r) {
        r.listen((event) {
          final flashcardSets = _parseElements(event);
          if (flashcardSets.isEmpty) {
            emit(const UserFlashcardState.empty());
          } else {
            emit(UserFlashcardState.loaded(flashcardSets: flashcardSets));
          }
        });
      },
    );
  }

  List<FlashcardSet> _parseElements(
    QuerySnapshot<Map<String, dynamic>> querySnapshot,
  ) {
    final flashcardSets = <FlashcardSet>[];
    for (var element in querySnapshot.docs) {
      final data = element.data();
      final flashcardSet = FlashcardSet.fromJson(data);
      flashcardSets.add(flashcardSet);
    }

    flashcardSets.sort((flashcardSet1, flashcardSet2) {
      final flashcard1Timestamp = DateTime.fromMillisecondsSinceEpoch(
          flashcardSet1.flashCard.timeStamp);
      final flashcard2Timestamp = DateTime.fromMillisecondsSinceEpoch(
          flashcardSet2.flashCard.timeStamp);

      return flashcard2Timestamp.compareTo(flashcard1Timestamp);
    });

    return flashcardSets;
  }
}
