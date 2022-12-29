import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/check_flashcaard.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_ref.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/learn_method.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/model/to_learn_word.dart';
import 'package:primus/model/word.dart';
import 'package:primus/model/user.dart' as user;

class FlashcardMainViewModel extends ChangeNotifier {
  FlashcardMainViewModel({required this.flascardId}) {
    _init();
  }

  final String flascardId;
  late String reference = 'flashcardSet/$flascardId';
  bool loaded = false;
  CheckFlashcard showAddWidget = CheckFlashcard.empty;

  List<Word> allKnowWords = [];
  List<Word> allUnknowWords = [];

  late FlashCardSet flashCardSet;
  late String language;
  late DocumentReference document;
  late String nameSet;
  late user.User currentUser;

  void _init() async {
    flashCardSet = await getDocument();
    nameSet = flashCardSet.flashcard.nameSet;
    language = flashCardSet.flashcard.languageSet;

    currentUser = await _getCurrentUser();
    setWords();
    loaded = true;
    notifyListeners();
  }

  Future<user.User> _getCurrentUser() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var userDocument = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    return user.User.fromJson(userDocument.data() as Map<String, dynamic>);
  }

  Future<void> copyFlashcardSetToLearn() async {
    if (currentUser.toLearn != null && currentUser.toLearn!.any((element) => element.flashcardId == flashCardSet.flashcard.id)) {
      var toLearn = currentUser.toLearn!.where((element) => element.flashcardId == flashCardSet.flashcard.id).first.copyWith(timeStamp: DateTime.now().millisecondsSinceEpoch);
      var indexToUpdate = currentUser.toLearn!.indexWhere((element) => element.flashcardId == flashCardSet.flashcard.id);
      currentUser.toLearn![indexToUpdate] = toLearn;

      await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(currentUser.uid).update({'toLearn': currentUser.toLearn!.map((e) => e.toJson()).toList()});

      notifyListeners();

      return;
    }

    List<ToLearn> updateToLearn = [];
    if (currentUser.toLearn == null || currentUser.toLearn!.isEmpty) {
      updateToLearn.add(
        ToLearn(
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          flashcardId: flashCardSet.flashcard.id,
          words: flashCardSet.flashcard.words
              .map(
                (e) => ToLearnWord(
                  word: e,
                  learnMethod: LearnMethod(flashcard: false, spelling: false, test: false),
                ),
              )
              .toList(),
        ),
      );
    } else {
      updateToLearn.addAll(currentUser.toLearn!);
      updateToLearn.add(
        ToLearn(
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          flashcardId: flashCardSet.flashcard.id,
          words: flashCardSet.flashcard.words
              .map(
                (e) => ToLearnWord(word: e, learnMethod: LearnMethod(flashcard: false, spelling: false, test: false)),
              )
              .toList(),
        ),
      );
    }

    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(currentUser.uid).update({'toLearn': updateToLearn.map((e) => e.toJson()).toList()});
    currentUser = currentUser.copyWith(toLearn: updateToLearn);
    notifyListeners();
  }

  Future<FlashCardSet> getDocument() async {
    document = FirebaseFirestore.instance.doc(reference);
    var data = await document.get();
    var flashcardData = data.data();
    return FlashCardSet.fromJson(flashcardData as Map<String, dynamic>);
  }

  void setWords({setLoaded = false}) {
    if (setLoaded) {
      loaded = false;
      notifyListeners();
    }

    allKnowWords.clear();
    allUnknowWords.clear();

    if (currentUser.toLearn == null || currentUser.toLearn!.isEmpty) {
      return;
    }

    if (currentUser.toLearn!.where((element) => element.flashcardId == reference.split('/')[1]).isEmpty) {
      return;
    }

    var words = currentUser.toLearn!.where((element) => element.flashcardId == reference.split('/')[1]).first.words;
    for (var element in words) {
      if (element.learnMethod.flashcard == true && element.learnMethod.spelling == true && element.learnMethod.test == true) {
        allKnowWords.add(element.word);
      } else {
        allUnknowWords.add(element.word);
      }
    }

    if (setLoaded) {
      loaded = true;
    }

    notifyListeners();
  }
}
