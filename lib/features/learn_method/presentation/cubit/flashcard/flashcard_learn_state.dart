part of 'flashcard_learn_cubit.dart';

@freezed
class FlashcardLearnState with _$FlashcardLearnState {
  const factory FlashcardLearnState.initial() = _Initial;
  const factory FlashcardLearnState.loaded({
    required bool learnAgain,
    required String language,
    required List<ToLearnWord> know,
    required List<ToLearnWord> unknow,
    required ToLearn toLearn,
  }) = _Loaded;
}
