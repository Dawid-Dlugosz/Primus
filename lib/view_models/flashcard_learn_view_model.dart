import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class FlashcardLearnViewModel extends ChangeNotifier {
  FlashcardLearnViewModel({required this.uid, required this.flashcard}) {
    _init();
  }

  final String uid;
  final Flashcard flashcard;

  bool loaded = false;
  bool showAddWidget = false;

  List<Widget> allKnowWords = [];
  List<Widget> allUnknowWords = [];

  void _init() {
    showAddWidget = _checkFlashcardOwner();

    for (var element in flashcard.words) {
      allKnowWords.add(
        FLipFlashcard(
          wordDefinition: element.definition,
          word: element.word,
          language: flashcard.languageSet,
        ),
      );
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
