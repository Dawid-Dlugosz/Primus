import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/create_flashcard/domain/repository/create_flash_card_repository.dart';

import '../../../../core/failure.dart';

part 'cud_flashcard_state.dart';
part 'cud_flashcard_cubit.freezed.dart';

enum CreateFlashcardError {
  nameBusy,
  tooShort,
  general,
  delete,
}

class CUDFlashcardCubit extends Cubit<CUDFlashcardState> {
  CUDFlashcardCubit({required this.flashcardRepository})
      : super(
          const CUDFlashcardState.initial(),
        );

  final FlashcardRepository flashcardRepository;

  void setFlashcardSetToEdit() {
    emit(const CUDFlashcardState.loadind());
  }

  void createFlashcardSet({
    required String name,
    required String language,
    required List<TextEditingController> words,
    required List<TextEditingController> definitions,
  }) async {
    emit(const CUDFlashcardState.loadind());
    final result = await flashcardRepository.createFlashcardSet(
      name: name,
      language: language,
      words: words,
      definitions: definitions,
    );

    result.fold(
      (l) => _generateErrorState(l),
      (r) => emit(CUDFlashcardState.success(flashcardSetId: r)),
    );
  }

  void deleteFlashcardSet({required String flashcardId}) async {
    emit(const CUDFlashcardState.loadind());

    final result =
        await flashcardRepository.deleteFlashcardSet(flashcardId: flashcardId);

    result.fold(
      (l) => emit(
        const CUDFlashcardState.error(
            errorMessage: CreateFlashcardError.delete),
      ),
      (r) => emit(CUDFlashcardState.success(flashcardSetId: flashcardId)),
    );
  }

  void _generateErrorState(Failure failure) {
    if (failure == const Failure.tooShort()) {
      emit(const CUDFlashcardState.error(
          errorMessage: CreateFlashcardError.tooShort));
    }

    if (failure == const Failure.flashcardNameBuse()) {
      emit(const CUDFlashcardState.error(
          errorMessage: CreateFlashcardError.nameBusy));
    }
    if (failure == const Failure.general()) {
      emit(const CUDFlashcardState.error(
          errorMessage: CreateFlashcardError.general));
    }
  }
}
