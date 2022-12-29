import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/dialog/delete_flashcard.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/user.dart' as u;

class AllFlashCardViewModel extends ChangeNotifier {
  AllFlashCardViewModel({required this.context}) {
    _init();
  }

  final BuildContext context;
  bool loaded = false;

  late String uid;

  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;

    loaded = true;
    notifyListeners();
  }

  Future<List<Flashcard>> getUserFlahscards() async {
    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    var user = u.User.fromJson(document.data() as Map<String, dynamic>);

    List<Flashcard> flashcards = [];
    if (user.ownFlashcard == null || user.ownFlashcard!.isEmpty) {
      return flashcards;
    }

    for (var element in user.ownFlashcard!) {
      DocumentReference docRef = FirebaseFirestore.instance.doc(element);
      var document = await docRef.get();

      var flashcardSet = document.data() as Map<String, dynamic>;
      flashcards.add(FlashCardSet.fromJson(flashcardSet).flashcard);
    }
    flashcards.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
    return flashcards;
  }

  Future<void> deleteFlashcard(String flashcardId) async {
    Navigator.pop(context);
    loaded = false;
    notifyListeners();

    var currentUserDocument = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    var currentUser = u.User.fromJson(currentUserDocument.data()!);

    var ownFlashcard = currentUser.ownFlashcard;
    ownFlashcard!.removeWhere((element) => element == 'flashcardSet/$flashcardId');

    currentUser = currentUser.copyWith(ownFlashcard: ownFlashcard);

    await FirebaseFirestore.instance.collection(FirebaseCollection.flashcardSet.name).doc(flashcardId).delete();
    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).update({'ownFlashcard': ownFlashcard.map((e) => e).toList()});

    loaded = true;
    notifyListeners();
  }
}
