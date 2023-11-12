import 'dart:math';

import 'package:flutter/material.dart';
import '../../model/test_word.dart';
import 'test_item.dart';
import '../../view_models/flashcard_test_view_model.dart';

class TestCard extends StatelessWidget {
  const TestCard({required this.answer, required this.viewModel, Key? key})
      : super(key: key);

  final TestWord answer;
  final FlashcardTestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                viewModel.wordIndex != 0
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: viewModel.decWordIndex)
                    : Container(),
                Text('Słowo: ${answer.word.word}'),
                viewModel.wordIndex != viewModel.testWords.length - 1
                    ? Transform.rotate(
                        angle: pi,
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: viewModel.incWordIndex),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView(
                children: [
                  TestItem(
                      definition: answer.answerA,
                      setAnswer: viewModel.setAnswer,
                      testWord: answer),
                  TestItem(
                      definition: answer.answerB,
                      setAnswer: viewModel.setAnswer,
                      testWord: answer),
                  TestItem(
                      definition: answer.answerC,
                      setAnswer: viewModel.setAnswer,
                      testWord: answer),
                  TestItem(
                      definition: answer.answerD,
                      setAnswer: viewModel.setAnswer,
                      testWord: answer),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
