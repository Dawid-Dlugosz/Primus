part of 'single_choice_test_cubit.dart';

@freezed
class SingleChoiceTestState with _$SingleChoiceTestState {
  const factory SingleChoiceTestState.initial() = _Initial;
  const factory SingleChoiceTestState.loaded({
    required List<ToLearnWord> know,
    required List<ToLearnWord> unknow,
    required ToLearn toLearn,
    required List<TestWord> testWords,
    required bool showAgain,
  }) = _Loaded;
}
