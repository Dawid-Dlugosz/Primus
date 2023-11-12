import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../enum/collection.dart';
import '../model/test_word.dart';
import '../model/to_learn.dart';
import '../model/to_learn_word.dart';
import '../model/user.dart' as user;

class FlashcardTestViewModel extends ChangeNotifier {
  FlashcardTestViewModel({required this.flashcardId, required this.context}) {
    _init();
  }

  final String flashcardId;
  final BuildContext context;
  late String uid;
  late user.User currentUser;
  late ToLearn toLearn;

  bool showOnlyUnknow = true;
  bool shufleList = true;
  bool loaded = false;

  int wordIndex = 0;

  List<ToLearnWord> words = [];
  List<ToLearnWord> allUnknowWords = [];
  List<ToLearnWord> allKnowWords = [];
  List<TestWord> testWords = [];
  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .get();
    currentUser = user.User.fromJson(document.data()!);
    toLearn = currentUser.toLearn!
        .where((element) => element.flashcardId == flashcardId)
        .first;

    splitWords();
    wordToShow();

    // Create from toLeranWord test words whos show in test
    for (var element in words) {
      testWords.add(createTestWord(element));
    }

    loaded = true;
    notifyListeners();
  }

  // TODO SPLIT TO KNOW AND UNKNOW
  void splitWords() {
    allKnowWords.clear();
    allUnknowWords.clear();

    for (var element in toLearn.words) {
      if (element.learnMethod.test) {
        allKnowWords.add(element);
      } else {
        allUnknowWords.add(element);
      }
    }
  }

  void adaptWordToTest() {}

  void wordToShow() {
    words.clear();

    if (showOnlyUnknow) {
      words.addAll(allUnknowWords);
    } else {
      words = List.from(allUnknowWords)..addAll(allKnowWords);
    }
    if (shufleList) {
      words.shuffle();
    }
    wordIndex = 0;
    notifyListeners();
  }

  TestWord createTestWord(ToLearnWord toLearnWord) {
    var answers = <ToLearnWord>[];
    var rng = Random();

    // all words without current word
    var tmpWord = toLearn.words
        .where((element) => element.word.id != toLearnWord.word.id);

    Set<int> randomNumber = {};
    while (randomNumber.length < 3) {
      var randomIndex = rng.nextInt(tmpWord.length);
      randomNumber.add(randomIndex);
    }

    // get only 3 answer bcz must be one correct answer
    for (var i = 0; i < 3; i++) {
      answers.add(tmpWord.elementAt(randomNumber.elementAt(i)));
    }

    answers.add(toLearnWord);
    // random answers
    answers.shuffle();

    var answer = TestWord(
      answerA: answers[0].word.definition,
      answerB: answers[1].word.definition,
      answerC: answers[2].word.definition,
      answerD: answers[3].word.definition,
      word: toLearnWord.word,
    );

    return answer;
  }

  void incWordIndex() {
    wordIndex++;
    notifyListeners();
  }

  void decWordIndex() {
    wordIndex--;
    notifyListeners();
  }

  void setAnswer(String answer) async {
    if (testWords[wordIndex].answer == null) {
      testWords[wordIndex].answer = answer;
      notifyListeners();
      if (testWords[wordIndex].word.definition == answer) {
        await markWordAsKnow();
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Podałeś już odpowiedź'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> markWordAsKnow() async {
    var word = testWords[wordIndex].word;
    var index =
        toLearn.words.indexWhere((element) => element.word.id == word.id);
    var learnMethod = toLearn.words[index].learnMethod.copyWith(test: true);
    toLearn.words[index] =
        toLearn.words[index].copyWith(learnMethod: learnMethod);

    var toLearnIndex = currentUser.toLearn!
        .indexWhere((element) => element.flashcardId == toLearn.flashcardId);

    currentUser.toLearn![toLearnIndex] == toLearn;

    FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .update(
            {'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});
    notifyListeners();
  }

  void clearProgress() async {
    loaded = false;
    notifyListeners();

    for (var i = 0; i < toLearn.words.length; i++) {
      var learnMethodCopy = toLearn.words[i].learnMethod.copyWith(test: false);
      toLearn.words[i] =
          toLearn.words[i].copyWith(learnMethod: learnMethodCopy);
    }

    var toLearnIndex = currentUser.toLearn!
        .indexWhere((element) => element.flashcardId == toLearn.flashcardId);

    currentUser.toLearn![toLearnIndex] = toLearn;

    await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .update(
            {'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});

    testWords.clear;
    splitWords();
    wordToShow();

    // Create from toLeranWord test words whos show in test
    for (var element in words) {
      testWords.add(createTestWord(element));
    }

    loaded = true;
    notifyListeners();
  }

  void showAlWords() {
    loaded = false;

    showOnlyUnknow = false;
    notifyListeners();

    testWords.clear;
    splitWords();
    wordToShow();

    // Create from toLeranWord test words whos show in test
    for (var element in words) {
      testWords.add(createTestWord(element));
    }

    loaded = true;
    notifyListeners();
  }
}
