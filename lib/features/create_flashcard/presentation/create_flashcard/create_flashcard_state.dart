part of 'create_flashcard_cubit.dart';

@freezed
class CreateFlashcardState with _$CreateFlashcardState {
  const factory CreateFlashcardState.initial() = _Initial;
  const factory CreateFlashcardState.success({
    required String flashcardSetId,
  }) = _Success;
  const factory CreateFlashcardState.error({
    required CreateFlashcardErrors errorMessage,
  }) = _Error;
  const factory CreateFlashcardState.loadind() = _Loading;
}
