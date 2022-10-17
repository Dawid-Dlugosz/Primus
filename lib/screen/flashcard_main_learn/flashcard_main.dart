import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/widgets/author_widget.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';
import 'package:primus/widgets/go_to_learn.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:primus/widgets/swiper_tinder/swiper_empty.dart';
import 'package:primus/widgets/swiper_tinder/swiper_tinder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashCardMain extends StatefulWidget {
  const FlashCardMain({Key? key}) : super(key: key);

  @override
  State<FlashCardMain> createState() => _FlashCardMainState();
}

class _FlashCardMainState extends State<FlashCardMain> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardLearnViewModel>(
      builder: ((context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(viewModel.flashcard.nameSet),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      viewModel.showAddWidget ? const AuthorWidget() : Container(),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                tabs: [
                                  Tab(
                                    text: AppLocalizations.of(context)!.learnedWord,
                                  ),
                                  Tab(
                                    text: AppLocalizations.of(context)!.unknowWord,
                                  ),
                                ],
                                indicatorSize: TabBarIndicatorSize.tab,
                              ),
                              Expanded(
                                child: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    viewModel.allKnowWords.isNotEmpty ? SwiperTinder(words: viewModel.allKnowWords) : const SwiperEmpty(),
                                    viewModel.allUnknowWords.isNotEmpty ? SwiperTinder(words: viewModel.allUnknowWords) : const SwiperEmpty(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            GoToLearn(
                              iconData: Icons.copy_rounded,
                              text: AppLocalizations.of(context)!.flashcards,
                              learnMode: () {
                                //TODO GO TO FLASHCARD LEARN
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GoToLearn(
                              iconData: Icons.ballot_outlined,
                              text: AppLocalizations.of(context)!.test,
                              learnMode: () {
                                //TODO GO TO TEST LEARN
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GoToLearn(
                              iconData: Icons.spellcheck_outlined,
                              text: AppLocalizations.of(context)!.spelling,
                              learnMode: () {
                                //TODO GO TO WRITE MODE
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const LoadingWidget();
      }),
    );
  }
}
