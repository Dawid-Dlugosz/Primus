import 'package:flutter/material.dart';
import '../../dialog/flascard_learn_settings.dart';
import 'test_card.dart';
import '../../utils/shared_preferences.dart';
import '../../view_models/flashcard_test_view_model.dart';
import '../../widgets/flascard_learn/empty_words.dart';
import 'package:provider/provider.dart';

class FlashcardExam extends StatefulWidget {
  const FlashcardExam({Key? key}) : super(key: key);

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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tryb nauki: Test'),
                      InkWell(
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return FlashcardLearnSettings(
                                // TODO PRZEROBIĆ TO TAK ŻEBY NIE PRZEKAZYWAC SHOWONLYUNKNOW TYLKO FUKNCJĘ KTÓRA ZMIENIA JEJ WARTOŚĆ
                                showOnlyUnknow: true,
                                learnOneMoreTime: () {},
                              );
                            },
                          ).then((value) async {
                            await setFlashcardSettingsKnowWord(true);
                          });
                        },
                        child: const Icon(Icons.settings),
                      ),
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
