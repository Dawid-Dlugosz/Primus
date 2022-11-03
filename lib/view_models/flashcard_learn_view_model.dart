import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/word.dart';
import 'package:primus/utils/firebase_collection.dart';

class FlashcardLearnViewModel extends ChangeNotifier {
  FlashcardLearnViewModel({required this.uid, required this.setName}) {
    _init();
  }

  final String uid;
  final String setName;

  bool loaded = false;
  bool showOnlyUnknow = true;
  bool shufleList = true;
  bool learnAgain = false;

  int currentIndex = 0;

  List<Word> words = [];
  List<Word> knowWords = [];
  List<Word> unknowWords = [];

  late FlashCardSet flashCardSet;
  late Flashcard flashcard;
  late DocumentReference document;
  late String language;

  void _init() async {
    document = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(uid);
    flashCardSet = await getDocument();

    flashcard = flashCardSet.flashcards.where((elemennt) => elemennt.nameSet == setName).first;

    // This function mus be last bcz set loaded to true
    await setWords();
  }

  void wordsToShow() {
    if (showOnlyUnknow) {
      words.addAll(unknowWords);
    } else {
      words = List.from(unknowWords)..addAll(knowWords);
    }
    if (shufleList) {
      words.shuffle();
    }
    learnAgain = false;
    currentIndex = 0;
    notifyListeners();
  }

  Future<FlashCardSet> getDocument() async {
    var documentFlashcards = await document.get();
    var flashcardData = documentFlashcards.data();
    return FlashCardSet.fromJson(flashcardData as Map<String, dynamic>);
  }

  Future<void> setWords() async {
    loaded = false;
    notifyListeners();

    language = flashCardSet.flashcards.where((element) => element.nameSet == setName).first.languageSet;

    var split = splitWords(flashcards: flashCardSet.flashcards, nameSet: setName);
    knowWords.clear();
    unknowWords.clear();

    knowWords.addAll(split.allKnowWords);
    unknowWords.addAll(split.allUnknowWords);

    wordsToShow();

    loaded = true;
    notifyListeners();
  }

  void markAsKnow() {
    var tmp = unknowWords[currentIndex];

    flashcard.words[flashcard.words.indexWhere((element) => element == tmp)] == tmp;
    currentIndex++;
    notifyListeners();
  }
}
