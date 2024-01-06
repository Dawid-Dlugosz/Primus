import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../create_flashcard/domain/entity/word.dart';

part 'test_word.freezed.dart';

@freezed
class TestWord with _$TestWord {
  const factory TestWord({
    required String answerA,
    required String answerB,
    required String answerC,
    required String answerD,
    required Word word,
    String? answer,
  }) = _TestWord;
}
