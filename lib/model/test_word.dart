import 'package:primus/model/word.dart';

class TestWord {
  TestWord({required this.answerA, required this.answerB, required this.answerC, required this.answerD, required this.word, this.answer});

  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final Word word;
  String? answer;

  TestWord copyWith({
    String? answerA,
    String? answerB,
    String? answerC,
    String? answerD,
    Word? word,
  }) =>
      TestWord(
        answerA: answerA ?? this.answerA,
        answerB: answerB ?? this.answerB,
        answerC: answerC ?? this.answerC,
        answerD: answerD ?? this.answerD,
        word: word ?? this.word,
      );
}
