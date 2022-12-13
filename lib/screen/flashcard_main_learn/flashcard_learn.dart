import 'package:flutter/material.dart';
import 'package:primus/dialog/flascard_learn_settings.dart';
import 'package:primus/utils/shared_preferences.dart';
import 'package:primus/widgets/flascard_learn/empty_words.dart';
import 'package:primus/widgets/flascard_learn/swiper_flascard.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/widgets/again_learn_flashcard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class FlashcardLearn extends StatefulWidget {
  const FlashcardLearn({Key? key}) : super(key: key);

  @override
  State<FlashcardLearn> createState() => _FlashcardLearnState();
}

class _FlashcardLearnState extends State<FlashcardLearn> {
  bool block = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardLearnViewModel>(
      builder: ((context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, viewModel.flashcardId),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.learnModeFlashcard,
                      ),
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
                            await setFlashcardSettingsKnowWord(viewModel.showOnlyUnknow);
                          });
                        },
                        child: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
                body: !viewModel.learnAgain
                    ? WillPopScope(
                        onWillPop: () {
                          Navigator.pop(context, viewModel.flashcardId);
                          return Future(() => true);
                        },
                        child: viewModel.words.isEmpty
                            ? EmptyWords(
                                showAllWords: viewModel.showAllWords,
                                clearProgress: viewModel.clearPorgress,
                              )
                            : SwiperFlashcard(viewModel: viewModel),
                      )
                    : AgainLearnFlashcard(
                        again: () => viewModel.learnOneMoreTime(),
                      ),
              )
            : const LoadingWidget();
      }),
    );
  }
}
