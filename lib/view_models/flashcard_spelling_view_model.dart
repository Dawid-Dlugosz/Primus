import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../enum/collection.dart';
import '../model/spelling_word.dart';
import '../model/to_learn.dart';
import '../model/user.dart' as user;
import '../utils/shared_preferences.dart';

class FlashcardSpellingViewModel extends ChangeNotifier {
  FlashcardSpellingViewModel({required this.flashcardId}) {
    _init();
  }

  final String flashcardId;
  late String uid;
  late ToLearn toLearn;
  late user.User currentUser;
  List<SpellingWord> spellingWords = [];
  List<SpellingWord> allUnknowWords = [];
  List<SpellingWord> allKnowWords = [];

  bool loaded = false;
  bool wrongDefinition = false;
  bool showOnlyUnknow = true;
  bool shufleList = true;

  TextEditingController textEditingController = TextEditingController();
  // Index of word was is current display
  int wordIndex = 0;
  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    showOnlyUnknow = await getFlashcardSettingsKnowWord();
    var document = await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .get();
    currentUser = user.User.fromJson(document.data()!);

    splitWords();
    wordsToShow();

    loaded = true;
    notifyListeners();
  }

  void splitWords() {
    toLearn = currentUser.toLearn!
        .where((element) => element.flashcardId == flashcardId)
        .first;

    allKnowWords.clear();
    allUnknowWords.clear();

    for (var element in toLearn.words) {
      var spellingWord =
          SpellingWord(word: element.word, showHint: false, correct: false);
      if (element.learnMethod.spelling) {
        allKnowWords.add(spellingWord);
      } else {
        allUnknowWords.add(spellingWord);
      }
    }
  }

  void wordsToShow() {
    spellingWords.clear();

    if (showOnlyUnknow) {
      spellingWords.addAll(allUnknowWords);
    } else {
      spellingWords = List.from(allUnknowWords)..addAll(allKnowWords);
    }
    if (shufleList) {
      spellingWords.shuffle();
    }
    wordIndex = 0;
    notifyListeners();
  }

  void markAsUnknow({String? enterText}) {
    spellingWords[wordIndex] =
        spellingWords[wordIndex].copyWith(showHint: true);
    spellingWords[wordIndex].enterWord = enterText;
    notifyListeners();
  }

  void markAsKnow() {
    var spellingWord = spellingWords[wordIndex];
    setEnterWord();
    if (textEditingController.text == spellingWord.word.definition) {
      var index = toLearn.words
          .indexWhere((element) => element.word.id == spellingWord.word.id);
      var learnMethod = toLearn.words[index].learnMethod;
      toLearn.words[index] = toLearn.words[index]
          .copyWith(learnMethod: learnMethod.copyWith(spelling: true));
      spellingWords[wordIndex] =
          spellingWords[wordIndex].copyWith(correct: true);
      var toLearnIndex = currentUser.toLearn!
          .indexWhere((element) => element.flashcardId == flashcardId);
      currentUser.toLearn![toLearnIndex] = toLearn;
      wrongDefinition = false;
      FirebaseFirestore.instance
          .collection(FirebaseCollection.users.name)
          .doc(uid)
          .update({
        'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()
      });
    } else {
      wrongDefinition = true;
    }

    notifyListeners();
  }

  void setEnterWord() {
    spellingWords[wordIndex].enterWord = textEditingController.text;
    wrongDefinition = false;
    notifyListeners();
  }

  void incWordIndex() {
    wordIndex++;
    textEditingController.text = spellingWords[wordIndex].enterWord ?? '';
    wrongDefinition = false;
    notifyListeners();
  }

  void decWordIndex() {
    wordIndex--;
    textEditingController.text = spellingWords[wordIndex].enterWord ?? '';
    wrongDefinition = false;
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

  void clearProgress() async {
    loaded = false;
    notifyListeners();

    var toLearn = currentUser.toLearn!
        .where((element) => element.flashcardId == flashcardId)
        .first;

    // Replace object in table, can't change sigle variable bcz is final
    for (var i = 0; i < toLearn.words.length; i++) {
      var toLearnCopy = toLearn.words[i].learnMethod.copyWith(spelling: false);
      toLearn.words[i] = toLearn.words[i].copyWith(learnMethod: toLearnCopy);
    }

    currentUser.toLearn!
            .where((element) => toLearn.flashcardId == element.flashcardId)
            .first ==
        toLearn;

    await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .update(
            {'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});
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
}
