import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../create_flashcard/domain/entity/word.dart';
import 'learn_method.dart';

part 'to_learn_word.freezed.dart';
part 'to_learn_word.g.dart';

@freezed
class ToLearnWord with _$ToLearnWord {
  const ToLearnWord._();

  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ToLearnWord({
    required LearnMethod learnMethod,
    required Word word,
  }) = _ToLearnWord;

  factory ToLearnWord.fromJson(Map<String, dynamic> json) =>
      _$ToLearnWordFromJson(json);

  bool isKnowedWord() =>
      learnMethod.spelling && learnMethod.flashcard && learnMethod.test;
}
