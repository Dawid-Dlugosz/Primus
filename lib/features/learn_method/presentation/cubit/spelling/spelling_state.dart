part of 'spelling_cubit.dart';

@freezed
class SpellingState with _$SpellingState {
  const factory SpellingState.initial() = _Initial;
  const factory SpellingState.loaded({
    required List<SpellingWord> know,
    required List<SpellingWord> unknow,
    required bool wrongDefinition,
    required ToLearn toLearn,
  }) = _Loaded;
}
