part of 'to_learn_cubit.dart';

@freezed
class ToLearnState with _$ToLearnState {
  const factory ToLearnState.initial() = _Initial;
  const factory ToLearnState.loaded({
    required String name,
    required ToLearn toLearn,
  }) = _Loaded;
}
