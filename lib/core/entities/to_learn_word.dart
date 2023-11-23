import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_learn_word.g.dart';
part 'to_learn_word.freezed.dart';

// TODO ZROBIĆ TOLEARwORD DWA OBIEKTY
@freezed
class ToLearnWord with _$ToLearnWord {
  const factory ToLearnWord({
    required String x,
    required String y,
    // required LearnMethod learnMethod,
    // required Word word,
  }) = _ToLearnWord;

  factory ToLearnWord.fromJson(Map<String, dynamic> json) =>
      _$ToLearnWordFromJson(json);
}
