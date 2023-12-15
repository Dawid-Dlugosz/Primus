part of 'cud_flashcard_cubit.dart';

@freezed
class CUDFlashcardState with _$CUDFlashcardState {
  const factory CUDFlashcardState.initial() = _Initial;
  const factory CUDFlashcardState.success({
    required String flashcardSetId,
  }) = _Success;
  const factory CUDFlashcardState.editing(
      {required FlashcardSet flashcardSet}) = _Editing;
  const factory CUDFlashcardState.error({
    required CreateFlashcardError errorMessage,
  }) = _Error;
  const factory CUDFlashcardState.loadind() = _Loading;
}
