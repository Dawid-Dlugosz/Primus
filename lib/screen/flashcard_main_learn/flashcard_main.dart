import 'package:flutter/material.dart';
import 'package:primus/dialog/copy_flashcard.dart';
import 'package:primus/screen/create_flashcard_page.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_learn.dart';
import 'package:primus/screen/flashcard_spelling.dart';
import 'package:primus/screen/test/flashcard_exam.dart';
import 'package:primus/view_models/create_flashcard_view_model.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/view_models/flashcard_main_view_model.dart';
import 'package:primus/view_models/flashcard_spelling_view_model.dart';
import 'package:primus/view_models/flashcard_test_view_model.dart';
import 'package:primus/widgets/author_widget.dart';
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
    return Consumer<FlashcardMainViewModel>(
      builder: ((context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(viewModel.nameSet),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      viewModel.currentUser.uid != viewModel.flashCardSet.owner
                          ? AuthorWidget(
                              nickname: viewModel.currentUser.nickname,
                              add: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider(
                                    create: (context) => FlashcardViewModel(context, flashcard: viewModel.flashCardSet.flashcard, copy: true),
                                    child: const CreateFlashcardPage(),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.amber,
                                child: TabBar(
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
                              ),
                              Expanded(
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    viewModel.allKnowWords.isNotEmpty ? SwiperTinder(words: viewModel.allKnowWords, language: viewModel.language) : const SwiperEmpty(),
                                    viewModel.allUnknowWords.isNotEmpty ? SwiperTinder(words: viewModel.allUnknowWords, language: viewModel.language) : const SwiperEmpty(),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeNotifierProvider(
                                      create: (context) => FlashcardLearnViewModel(flashcardId: viewModel.flascardId, context: context),
                                      child: const FlashcardLearn(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GoToLearn(
                              iconData: Icons.ballot_outlined,
                              text: AppLocalizations.of(context)!.test,
                              learnMode: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeNotifierProvider(
                                      create: (context) => FlashcardTestViewModel(flashcardId: viewModel.flascardId, context: context),
                                      child: const FlashcardExam(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GoToLearn(
                              iconData: Icons.spellcheck_outlined,
                              text: AppLocalizations.of(context)!.spelling,
                              learnMode: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeNotifierProvider(
                                      create: (context) => FlashcardSpellingViewModel(flashcardId: viewModel.flascardId),
                                      child: const FlashcardSpelling(),
                                    ),
                                  ),
                                );
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
