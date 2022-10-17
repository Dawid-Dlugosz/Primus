import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/unknowWord.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class FlashcardLearnViewModel extends ChangeNotifier {
  FlashcardLearnViewModel({required this.uid, required this.flashcard}) {
    _init();
  }

  final String uid;
  final Flashcard flashcard;

  bool loaded = false;
  bool showAddWidget = false;

  List<UnknowWord> allKnowWords = [];
  List<UnknowWord> allUnknowWords = [];

  void _init() {
    showAddWidget = _checkFlashcardOwner();

    for (var element in flashcard.words) {
      var widget = FLipFlashcard(
        wordDefinition: element.definition,
        word: element.word,
        language: flashcard.languageSet,
      );

      if (element.learModes.isEmpty || element.learModes.containsValue(false)) {
        allUnknowWords.add(
          UnknowWord(
            widget: widget,
            method: element.learModes,
          ),
        );
      } else {
        allUnknowWords.add(
          UnknowWord(
            widget: widget,
            method: element.learModes,
          ),
        );
      }
      // element.learModes.forEach((key, value) {
      //   if ()) {
      //     var widget = FLipFlashcard(
      //       wordDefinition: element.definition,
      //       word: element.word,
      //       language: flashcard.languageSet,
      //     );

      //     allKnowWords.add(
      //       UnknowWord(
      //         widget: widget,
      //         method: element.learModes,
      //       ),
      //     );
      //   }
      // });

    }

    loaded = true;
    notifyListeners();
  }

  bool _checkFlashcardOwner() {
    if (uid == FirebaseAuth.instance.currentUser!.uid) {
      return false;
    }

    return true;
  }
}
