import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/widgets/again_learn_flashcard.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class FlashcardLearn extends StatefulWidget {
  const FlashcardLearn({Key? key}) : super(key: key);

  @override
  State<FlashcardLearn> createState() => _FlashcardLearnState();
}

class _FlashcardLearnState extends State<FlashcardLearn> {
  CardController cardController = CardController();
  bool block = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardLearnViewModel>(
      builder: ((context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, viewModel.flashcard),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.learnModeFlashcard,
                      ),
                      InkWell(
                        onTap: () {
                          // TODO open settings
                        },
                        child: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
                body: !viewModel.learnAgain
                    ? WillPopScope(
                        onWillPop: () {
                          Navigator.pop(context, viewModel.flashcard);
                          return Future(() => true);
                        },
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 50),
                                height: MediaQuery.of(context).size.height * 0.7,
                                // Nie są to ważne TO DO
                                // TODO SPRÓBOWAĆ WYCENTROWAĆ PIERWSZY WIDGET W STACKU
                                // Jak Odwracam kartę trzeba pokazywać tylną, jak przy przesówaniu
                                // TODO WYWALIĆ NIEPOTRZEBNA WYMAGANA FUNKCJĘ <- biblioteka
                                child: SwipeCard(
                                  swipeLeft: () {
                                    viewModel.currentIndex++;
                                  },
                                  swipeRight: viewModel.markAsKnow,
                                  animDuration: 500,
                                  totalNum: viewModel.unknowWords.length,
                                  stackNum: viewModel.unknowWords.length,
                                  swipeEdge: 8.0,
                                  allowVerticalMovement: false,
                                  maxWidth: MediaQuery.of(context).size.width * 1,
                                  minWidth: MediaQuery.of(context).size.width * 0.9,
                                  minHeight: MediaQuery.of(context).size.height * 0.8,
                                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                                  cardBuilder: (context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: FLipFlashcard(
                                          word: viewModel.unknowWords[index].word,
                                          wordDefinition: viewModel.unknowWords[index].definition,
                                          language: viewModel.language,
                                        ),
                                      ),
                                    );
                                  },
                                  cardController: cardController,
                                  swipeCompleteCallback: (orientation, index) {
                                    if (index == viewModel.unknowWords.length - 1) {
                                      setState(() {
                                        viewModel.learnAgain = true;
                                      });
                                    }
                                  },
                                  swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {},
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    elevation: 10,
                                    heroTag: null,
                                    onPressed: () {
                                      cardController.swipeLeft();
                                      //TODO  SET WORD AS UNKNOW
                                    },
                                    child: const Icon(FontAwesomeIcons.xmark),
                                  ),
                                  FloatingActionButton(
                                    elevation: 10,
                                    heroTag: null,
                                    onPressed: () {
                                      cardController.swipeRight();
                                      //TODO  SET WORD AS KNOW
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.check,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : AgainLearnFlashcard(
                        again: viewModel.setWords,
                      ),
              )
            : const LoadingWidget();
      }),
    );
  }
}
