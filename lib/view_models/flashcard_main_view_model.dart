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
    // showAddWidget = await _checkFlashcardOwner();
    currentUser = await _getCurrentUser();
    await copyFlashcardSetToLearn();
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
      return;
    }

    List<ToLearn> updateToLearn = [];
    if (currentUser.toLearn == null || currentUser.toLearn!.isEmpty) {
      updateToLearn.add(ToLearn(flashcardId: flashCardSet.flashcard.id, words: flashCardSet.flashcard.words.map((e) => ToLearnWord(word: e, learnMethod: LearnMethod(flashcard: false, spelling: false, test: false))).toList()));
      await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(currentUser.uid).update({'toLearn': updateToLearn.map((e) => e.toJson()).toList()});
    } else {
      updateToLearn.addAll(currentUser.toLearn!);
      updateToLearn.add(ToLearn(flashcardId: flashCardSet.flashcard.id, words: flashCardSet.flashcard.words.map((e) => ToLearnWord(word: e, learnMethod: LearnMethod(flashcard: false, spelling: false, test: false))).toList()));
      await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(currentUser.uid).update({'toLearn': updateToLearn.map((e) => e.toJson()).toList()});
    }

    currentUser = currentUser.copyWith(toLearn: updateToLearn);
    notifyListeners();
  }

  Future<FlashCardSet> getDocument() async {
    document = FirebaseFirestore.instance.doc(reference);
    var data = await document.get();
    var flashcardData = data.data();
    return FlashCardSet.fromJson(flashcardData as Map<String, dynamic>);
  }

  // Future<CheckFlashcard> _checkFlashcardOwner() async {
  // late DocumentReference<Object?> currentRef;
  // late Map<String, dynamic>? loggedUserDoc;

  // var flahscardDoc = await document.get();

  // currentRef = flahscardDoc.reference;

  // var flashcardLoggedUserDoc = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(FirebaseAuth.instance.currentUser!.uid).get();
  // loggedUserDoc = flashcardLoggedUserDoc.data();

  // return CheckFlashcard.add;

  // if (uid == FirebaseAuth.instance.currentUser!.uid) {
  //   return CheckFlashcard.empty;
  // } else {
  //   if (loggedUserDoc?['flashcardRef'] == null) {
  //     return CheckFlashcard.add;
  //   } else {
  //     var flashcardRef = (loggedUserDoc!['flashcardRef'] as List).map((e) => FlashcardRef.fromJson(e)).toList();
  //     if (flashcardRef != null) {
  //       for (var element in flashcardRef) {
  //         if (element.ref == currentRef && element.name == setName) {
  //           return CheckFlashcard.copped;
  //         }
  //       }
  //       return CheckFlashcard.add;
  //     } else {
  //       return CheckFlashcard.add;
  //     }
  //   }
  // }
  // }

  void setWords({setLoaded = false}) {
    if (setLoaded) {
      loaded = false;
      notifyListeners();
    }

    allKnowWords.clear();
    allUnknowWords.clear();

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

  // TODO DO PRZETESTOWANIA CZY DOBRZE DZIAŁA
  Future<void> updateFlashcard(Flashcard flashcard) async {
    loaded = false;
    notifyListeners();

    // flashCardSet.flashcards[flashCardSet.flashcards.indexWhere((element) => element.nameSet == flashcard.nameSet)] = flashcard;
    await document.update({
      // 'flashcard': flashCardSet.flashcards.map((e) => e.toJson()).toList(),
    });
    setWords();
  }

  void add() async {
    await document.get().then((value) {
      var currentRef = <FlashcardRef>[];
      // var flashcardRef = flashCardSet.flashcardRef;
      // if (flashcardRef == null) {
      // currentRef.add(FlashcardRef(ref: value.reference, name: setName));
      // } else {
      // currentRef.addAll(flashcardRef);
      // currentRef.add(FlashcardRef(ref: value.reference, name: setName));
      // }

      var loginUserDocument = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(FirebaseAuth.instance.currentUser!.uid);

      loginUserDocument.update({
        'flashcardRef': currentRef.map((e) => e.toJson()).toList(),
      });
    });
  }
}
//
