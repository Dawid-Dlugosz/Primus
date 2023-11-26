import 'dart:math';

import 'package:flutter/material.dart';
import '../dialog/flascard_learn_settings.dart';
import '../utils/shared_preferences.dart';
import '../view_models/flashcard_spelling_view_model.dart';
import '../widgets/flascard_learn/empty_words.dart';
import '../core/screens/loading_widget.dart';
import 'package:provider/provider.dart';

class FlashcardSpelling extends StatefulWidget {
  const FlashcardSpelling({Key? key}) : super(key: key);

  @override
  State<FlashcardSpelling> createState() => _FlashcardSpellingState();
}

class _FlashcardSpellingState extends State<FlashcardSpelling> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardSpellingViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tryb nauki: Pisanie'),
                      InkWell(
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return FlashcardLearnSettings(
                                showOnlyUnknow: viewModel.showOnlyUnknow,
                                learnOneMoreTime: viewModel.learnOneMoreTime,
                              );
                            },
                          ).then((value) async {
                            await setFlashcardSettingsKnowWord(
                                viewModel.showOnlyUnknow);
                          });
                        },
                        child: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: viewModel.spellingWords.isNotEmpty
                        ? Card(
                            color: viewModel
                                    .spellingWords[viewModel.wordIndex].correct
                                ? Colors.green
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      viewModel.wordIndex != 0
                                          ? IconButton(
                                              icon:
                                                  const Icon(Icons.arrow_back),
                                              onPressed: () {
                                                viewModel.setEnterWord();
                                                viewModel.decWordIndex();
                                              },
                                            )
                                          : Container(),
                                      Text(
                                        viewModel
                                            .spellingWords[viewModel.wordIndex]
                                            .word
                                            .word,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      viewModel.wordIndex !=
                                              viewModel.spellingWords.length - 1
                                          ? Transform.rotate(
                                              angle: pi,
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back),
                                                onPressed: () {
                                                  viewModel.setEnterWord();
                                                  viewModel.incWordIndex();
                                                },
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                  viewModel.spellingWords[viewModel.wordIndex]
                                          .showHint
                                      ? Text(
                                          'Odpowiedź: ${viewModel.spellingWords[viewModel.wordIndex].word.definition}')
                                      : Container(),
                                  viewModel.spellingWords[viewModel.wordIndex]
                                          .correct
                                      ? RichText(
                                          text: TextSpan(
                                            text: 'Definicja ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: viewModel
                                                    .spellingWords[
                                                        viewModel.wordIndex]
                                                    .word
                                                    .definition,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            TextFormField(
                                              controller: viewModel
                                                  .textEditingController,
                                              decoration: InputDecoration(
                                                label: const Text(
                                                    'Podaj znaczenie słowa'),
                                                errorText: viewModel
                                                        .wrongDefinition
                                                    ? 'Podaj poprawną definicje'
                                                    : null,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                !viewModel
                                                        .spellingWords[
                                                            viewModel.wordIndex]
                                                        .showHint
                                                    ? ElevatedButton(
                                                        onPressed: viewModel
                                                            .markAsUnknow,
                                                        child: const Text(
                                                            'Pokaż podpowiedź'),
                                                      )
                                                    : Container(),
                                                !viewModel
                                                        .spellingWords[
                                                            viewModel.wordIndex]
                                                        .showHint
                                                    ? ElevatedButton(
                                                        onPressed: () {
                                                          viewModel
                                                              .markAsKnow();
                                                        },
                                                        child: const Text(
                                                            'Sprawdź'),
                                                      )
                                                    : viewModel.spellingWords
                                                                    .length -
                                                                1 !=
                                                            viewModel.wordIndex
                                                        ? ElevatedButton(
                                                            onPressed: () {
                                                              viewModel
                                                                  .setEnterWord();
                                                              viewModel
                                                                  .incWordIndex();
                                                            },
                                                            child: const Text(
                                                                'Dalej'),
                                                          )
                                                        : Container()
                                              ],
                                            )
                                          ],
                                        )
                                ],
                              ),
                            ),
                          )
                        : EmptyWords(
                            showAllWords: viewModel.showAllWords,
                            clearProgress: viewModel.clearProgress),
                  ),
                ),
              )
            : const LoadingWidget();
      },
    );
  }
}
