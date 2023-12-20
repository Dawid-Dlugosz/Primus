part of 'vocabulary_cubit.dart';

@freezed
class VocabularyState with _$VocabularyState {
  const factory VocabularyState.initial() = _Initial;
  const factory VocabularyState.error() = _Error;
  const factory VocabularyState.loading() = _Loading;
  const factory VocabularyState.loaded({
    required Vocabulary vocabulary,
  }) = _Loaded;
}
