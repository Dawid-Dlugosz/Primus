import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';

class FlashcardLearnViewModel extends ChangeNotifier {
  FlashcardLearnViewModel({required this.uid, required this.flashcard}) {
    _init();
  }

  final String uid;
  final Flashcard flashcard;

  void _init() {}
}
