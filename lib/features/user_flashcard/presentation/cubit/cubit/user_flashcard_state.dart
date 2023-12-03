part of 'user_flashcard_cubit.dart';

@freezed
class UserFlashcardState with _$UserFlashcardState {
  const factory UserFlashcardState.initial() = _Initial;
  const factory UserFlashcardState.loading() = _Loading;
  const factory UserFlashcardState.empty() = _Empty;
  const factory UserFlashcardState.loaded(
      {required List<FlashcardSet> flashcardSets}) = _Loaded;
  const factory UserFlashcardState.error() = _Error;
}
