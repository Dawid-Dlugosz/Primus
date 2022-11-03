import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/word.dart';
import 'package:primus/utils/firebase_collection.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class FlashcardMainViewModel extends ChangeNotifier {
  FlashcardMainViewModel({required this.uid, required this.setName}) {
    _init();
  }

  final String uid;
  final String setName;

  bool loaded = false;
  bool showAddWidget = false;

  List<Word> allKnowWords = [];
  List<Word> allUnknowWords = [];

  late FlashCardSet flashCardSet;
  late String language;
  late DocumentReference document;

  void _init() async {
    showAddWidget = _checkFlashcardOwner();
    flashCardSet = await getDocument();
    language = flashCardSet.flashcards.where((element) => element.nameSet == setName).first.languageSet;

    // This function mus be last bcz set loaded to true
    await setWords();
  }

  Future<FlashCardSet> getDocument() async {
    document = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(uid);
    var data = await document.get();
    var flashcardData = data.data();
    return FlashCardSet.fromJson(flashcardData as Map<String, dynamic>);
  }

  bool _checkFlashcardOwner() {
    // TODO copy flascrard set to own list
    if (uid == FirebaseAuth.instance.currentUser!.uid) {
      return false;
    }

    return true;
  }

  Future<void> setWords() async {
    loaded = false;
    notifyListeners();

    var split = splitWords(flashcards: flashCardSet.flashcards, nameSet: setName);
    allKnowWords.clear();
    allUnknowWords.clear();

    allKnowWords.addAll(split.allKnowWords);
    allUnknowWords.addAll(split.allUnknowWords);

    loaded = true;
    notifyListeners();
  }

  Future<void> updateFlashcard(Flashcard flashcard) async {
    loaded = false;
    notifyListeners();

    flashCardSet.flashcards[flashCardSet.flashcards.indexWhere((element) => element.nameSet == flashcard.nameSet)] = flashcard;
    await document.update({
      'flashcard': flashCardSet.flashcards.map((e) => e.toJson()).toList(),
    });
    await setWords();
  }
}
