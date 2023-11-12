import 'package:flutter/material.dart';
// import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class SwiperFlashcard extends StatefulWidget {
  SwiperFlashcard({required this.viewModel, Key? key}) : super(key: key);

  FlashcardLearnViewModel viewModel;

  @override
  State<SwiperFlashcard> createState() => _SwiperFlashcardState();
}

class _SwiperFlashcardState extends State<SwiperFlashcard> {
  // CardController cardController = CardController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height * 0.7,
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
                  // cardController.swipeLeft();
                  //TODO  SET WORD AS UNKNOW
                },
                child: const Icon(FontAwesomeIcons.xmark),
              ),
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
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
