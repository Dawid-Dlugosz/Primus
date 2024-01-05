import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primus/features/learn_method/presentation/cubit/flashcard/flashcard_learn_cubit.dart';
import 'package:primus/features/user/domain/entity/to_learn_word.dart';

import '../flip_card/flip_flashcard.dart';

class SwiperFlashcard extends StatefulWidget {
  const SwiperFlashcard({
    required this.words,
    required this.language,
    super.key,
  });

  final List<ToLearnWord> words;
  final String language;

  @override
  State<SwiperFlashcard> createState() => _SwiperFlashcardState();
}

class _SwiperFlashcardState extends State<SwiperFlashcard> {
  final CardSwiperController _controller = CardSwiperController();

  // TODO ZROBIĆ ZANZACZENIE UMIEIM/ NIE UMIEM NA ON SWIPE, JEŚLI W PRAWWO TO UMIEIM
  // NIE WIEM JAK TO ROZWIĄZAĆ PO STRONIE CUBITA, TO BO JEST PYTANIE CZY CHCE JESZCZE RAZ I JAK KLIKNE TAK, TO MAM TE SAME FISZKI
  // NIE ZALEZNIE CZY ODPOWIEDZIAŁEM DOBRZE CZY NIE. Wydaje mi sie ze najlepiej
  // bedzie przekazywać zmienione toLearn do userCubit który sobie będzie to aktualizoawł na bierząco
  // a do stanu, toLearn ze stanu i będzie git
  void _onSwipeLeft() {}
  void _onSwipeRight() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height * 0.7,
            child: CardSwiper(
              onEnd: () => context.read<FlashcardLearnCubit>().askAgain(),
              isLoop: false,
              controller: _controller,
              cardsCount: widget.words.length,
              numberOfCardsDisplayed: 3,
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FLipFlashcard(
                    word: widget.words[index].word.word,
                    wordDefinition: widget.words[index].word.definition,
                    language: widget.language,
                  ),
                );
              },
            ),
            // Nie są to ważne TO DO
            // TODO SPRÓBOWAĆ WYCENTROWAĆ PIERWSZY WIDGET W STACKU
            // Jak Odwracam kartę trzeba pokazywać tylną, jak przy przesówaniu
            // TODO WYWALIĆ NIEPOTRZEBNA WYMAGANA FUNKCJĘ <- biblioteka
            // child: SwipeCard(
            //   swipeLeft: widget.viewModel.markAsUnknow,
            //   swipeRight: widget.viewModel.markAsKnow,
            //   animDuration: 500,
            //   totalNum: widget.viewModel.words.length,
            //   stackNum: widget.viewModel.words.length,
            //   swipeEdge: 8.0,
            //   allowVerticalMovement: false,
            //   maxWidth: MediaQuery.of(context).size.width * 1,
            //   minWidth: MediaQuery.of(context).size.width * 0.9,
            //   minHeight: MediaQuery.of(context).size.height * 0.8,
            //   maxHeight: MediaQuery.of(context).size.height * 0.9,
            //   cardBuilder: (context, index) {
            //     return Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: FLipFlashcard(
            //           word: widget.viewModel.words[index].word.word,
            //           wordDefinition: widget.viewModel.words[index].word.definition,
            //           language: widget.viewModel.language,
            //         ),
            //       ),
            //     );
            //   },
            //   cardController: cardController,
            //   swipeCompleteCallback: (orientation, index) {
            //     if (index == widget.viewModel.words.length - 1) {
            //       setState(() {
            //         widget.viewModel.learnAgain = true;
            //       });
            //     }
            //   },
            //   swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {},
            // ),
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
                  _controller.swipeLeft();
                  // cardController.swipeLeft();
                  //TODO  SET WORD AS UNKNOW
                },
                child: const Icon(FontAwesomeIcons.xmark),
              ),
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
                  _controller.swipeRight();
                  // cardController.swipeRight();
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
    );
  }
}
