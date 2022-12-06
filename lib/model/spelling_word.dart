import 'package:primus/model/word.dart';

class SpellingWord {
  SpellingWord({required this.word, required this.showHint, required this.correct, this.enterWord});

  final Word word;
  final bool showHint;
  String? enterWord;
  bool correct;
  SpellingWord copyWith({Word? word, bool? showHint, String? enterWord, bool? correct}) => SpellingWord(
        word: word ?? this.word,
        showHint: showHint ?? this.showHint,
        correct: correct ?? this.correct,
      );
}
