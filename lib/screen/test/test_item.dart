import 'package:flutter/material.dart';
import 'package:primus/model/test_word.dart';

class TestItem extends StatelessWidget {
  const TestItem({required this.definition, required this.testWord, required this.setAnswer, Key? key}) : super(key: key);
  final String definition;
  final Function(String answer) setAnswer;
  final TestWord testWord;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setAnswer(definition),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: testWord.word.definition == testWord.answer && definition == testWord.answer
              ? Colors.green
              : definition != testWord.answer
                  ? null
                  : Colors.red,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(definition),
        ),
      ),
    );
  }
}
