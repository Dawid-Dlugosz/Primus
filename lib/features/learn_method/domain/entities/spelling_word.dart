import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';

part 'spelling_word.freezed.dart';

@freezed
class SpellingWord with _$SpellingWord {
  const SpellingWord._();

  const factory SpellingWord({
    required Word word,
    required bool showHint,
    required bool correct,
    String? enteredWord,
  }) = _SpellingWord;
}
