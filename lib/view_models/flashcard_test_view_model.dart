import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/test_word.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/model/to_learn_word.dart';
import 'package:primus/model/user.dart' as user;
import 'package:primus/model/word.dart';

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
  int wordIndex = 0;

  List<ToLearnWord> words = [];
  List<ToLearnWord> allUnknowWords = [];
  List<ToLearnWord> allKnowWords = [];

  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    currentUser = user.User.fromJson(document.data()!);
    toLearn = currentUser.toLearn!.where((element) => element.flashcardId == flashcardId).first;
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

  void getWordToExam() {
    var answers = <ToLearnWord>[];
    var rng = Random();

    // all words without current word
    var tmpWord = words.where((element) => element.word.id != words[wordIndex].word.id);

    // get only 3 answer bcz must be one correct answer
    for (var i = 0; i < 3; i++) {
      var randomIndex = rng.nextInt(tmpWord.length);
      answers.add(tmpWord.elementAt(randomIndex));
    }

    answers.add(words[wordIndex]);
    // random answers
    answers.shuffle();
  }
}
