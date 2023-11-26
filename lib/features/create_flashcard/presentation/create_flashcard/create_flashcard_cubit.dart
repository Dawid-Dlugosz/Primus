import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/create_flashcard/domain/repository/create_flash_card_repository.dart';

import '../../../../core/failure.dart';

part 'create_flashcard_state.dart';
part 'create_flashcard_cubit.freezed.dart';

enum CreateFlashcardError {
  nameBusy,
  tooShort,
  general,
}

class CreateFlashcardCubit extends Cubit<CreateFlashcardState> {
  CreateFlashcardCubit({required this.flashcardRepository})
      : super(
          const CreateFlashcardState.initial(),
        );

  final CreateFlashcardRepository flashcardRepository;

  Future<void> createFlashcardSet({
    required String name,
    required String language,
    required List<TextEditingController> words,
    required List<TextEditingController> definitions,
  }) async {
    emit(const CreateFlashcardState.loadind());
    final result = await flashcardRepository.createFlashcardSet(
      name: name,
      language: language,
      words: words,
      definitions: definitions,
    );

    result.fold(
      (l) => _generateErrorState(l),
      (r) => emit(CreateFlashcardState.success(flashcardSetId: r)),
    );
  }

  void _generateErrorState(Failure failure) {
    if (failure == const Failure.tooShort()) {
      emit(const CreateFlashcardState.error(
          errorMessage: CreateFlashcardError.tooShort));
    }

    if (failure == const Failure.flashcardNameBuse()) {
      emit(const CreateFlashcardState.error(
          errorMessage: CreateFlashcardError.nameBusy));
    }
    if (failure == const Failure.general()) {
      emit(const CreateFlashcardState.error(
          errorMessage: CreateFlashcardError.general));
    }
  }
}
