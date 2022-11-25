import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/learn_method.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/model/to_learn_word.dart';
import 'package:primus/model/word.dart';
import 'package:primus/model/user.dart' as user;
import 'package:primus/utils/shared_preferences.dart';

class FlashcardLearnViewModel extends ChangeNotifier {
  FlashcardLearnViewModel({required this.flascardId, required this.context}) {
    _init();
  }

  final String flascardId;
  final BuildContext context;

  late String reference = 'flashcardSet/$flascardId';

  bool loaded = false;
  bool showOnlyUnknow = true;
  bool shufleList = true;
  bool learnAgain = false;

  int currentIndex = 0;

  List<ToLearnWord> words = [];
  List<ToLearnWord> allKnowWords = [];
  List<ToLearnWord> allUnknowWords = [];

  late user.User currentUser;
  late ToLearn toLearn;
  late DocumentReference document;
  late String language;
  late FlashCardSet flashCardSet;
  late String uid;

  void _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    showOnlyUnknow = await getFlashcardSettingsKnowWord();
    document = FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid);
    currentUser = await getDocument();
    toLearn = currentUser.toLearn!.where((element) => element.flashcardId == flascardId).first;
    var flascardDocument = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcardSet.name).doc(toLearn.flashcardId).get();
    flashCardSet = FlashCardSet.fromJson(flascardDocument.data() as Map<String, dynamic>);
    language = flashCardSet.flashcard.languageSet;

    splitWords();
    wordsToShow();

    loaded = true;
    notifyListeners();
  }

  void learnOneMoreTime() {
    loaded = false;
    notifyListeners();

    splitWords();
    wordsToShow();

    loaded = true;
    notifyListeners();
  }

  // Show only unknow words or all words
  void wordsToShow({bool loaded = false}) {
    if (loaded) {
      loaded = false;
      notifyListeners();
    }
    words.clear();

    if (showOnlyUnknow) {
      words.addAll(allUnknowWords);
    } else {
      words = List.from(allUnknowWords)..addAll(allKnowWords);
    }
    if (shufleList) {
      words.shuffle();
    }

    learnAgain = false;
    currentIndex = 0;
    if (loaded) {
      loaded = true;
    }
    notifyListeners();
  }

  void splitWords() {
    var toLearn = currentUser.toLearn!.where((element) => element.flashcardId == flascardId).first;

    allKnowWords.clear();
    allUnknowWords.clear();

    toLearn.words.forEach((element) {
      if (element.learnMethod.flashcard) {
        allKnowWords.add(element);
      } else {
        allUnknowWords.add(element);
      }
    });
  }

  Future<user.User> getDocument() async {
    var userDocument = await document.get();
    var userData = userDocument.data();
    return user.User.fromJson(userData as Map<String, dynamic>);
  }

  void markAsKnow() async {
    var currentWordId = words[currentIndex].word.id;

    var index = toLearn.words.indexWhere((element) => element.word.id == currentWordId);

    var toLearnCopy = toLearn.words[index].learnMethod.copyWith(flashcard: true);
    toLearn.words[index] = toLearn.words[index].copyWith(learnMethod: toLearnCopy);

    currentUser.toLearn!.where((element) => toLearn.flashcardId == element.flashcardId).first == toLearn;

    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).update({'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});

    currentIndex++;
    notifyListeners();
  }

  void markAsUnknow() async {
    var currentWordId = words[currentIndex].word.id;

    var index = toLearn.words.indexWhere((element) => element.word.id == currentWordId);

    var toLearnCopy = toLearn.words[index].learnMethod.copyWith(flashcard: false);
    toLearn.words[index] = toLearn.words[index].copyWith(learnMethod: toLearnCopy);

    currentUser.toLearn!.where((element) => toLearn.flashcardId == element.flashcardId).first == toLearn;

    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).update({'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});

    currentIndex++;
    notifyListeners();
  }

  void clearPorgress() async {
    loaded = false;
    notifyListeners();

    var toLearn = currentUser.toLearn!.where((element) => element.flashcardId == flascardId).first;

    toLearn.words.map((e) {
      e.learnMethod.copyWith(flashcard: false);
    });

    // Replace object in table, can't change sigle variable bcz is final
    for (var i = 0; i < toLearn.words.length; i++) {
      var toLearnCopy = toLearn.words[i].learnMethod.copyWith(flashcard: false);
      toLearn.words[i] = toLearn.words[i].copyWith(learnMethod: toLearnCopy);
    }

    currentUser.toLearn!.where((element) => toLearn.flashcardId == element.flashcardId).first == toLearn;

    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).update({'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});
    splitWords();
    wordsToShow();

    loaded = true;
    notifyListeners();
  }

  void showAllWords() {
    loaded = false;
    showOnlyUnknow = false;
    notifyListeners();

    splitWords();
    wordsToShow();

    loaded = true;
    notifyListeners();
  }
}
