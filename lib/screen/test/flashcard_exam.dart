import 'package:flutter/material.dart';
import 'test_card.dart';
import '../../view_models/flashcard_test_view_model.dart';
import '../../widgets/flascard_learn/empty_words.dart';
import 'package:provider/provider.dart';

class FlashcardExam extends StatefulWidget {
  const FlashcardExam({super.key});

  @override
  State<FlashcardExam> createState() => _FlashcardExamState();
}

class _FlashcardExamState extends State<FlashcardExam> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardTestViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tryb nauki: Test'),
                    ],
                  ),
                ),
                body: viewModel.testWords.isNotEmpty
                    ? TestCard(
                        answer: viewModel.testWords[viewModel.wordIndex],
                        viewModel: viewModel,
                      )
                    : EmptyWords(clearProgress: viewModel.clearProgress),
              )
            : Container();
      },
    );
  }
}
