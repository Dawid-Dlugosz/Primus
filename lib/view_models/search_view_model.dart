import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../enum/collection.dart';
import '../model/flashcard.dart';

class SeachViewModel extends ChangeNotifier {
  SeachViewModel() {
    _init();
  }
  TextEditingController textEditingController = TextEditingController();
  bool loading = false;

  late Stream<QuerySnapshot<Map<String, dynamic>>> snapshot;
  late String userUid;

  var name = '';

  List<Flashcard> flashcards = [];

  void _init() async {
    loading = true;
    notifyListeners();
    snapshot = FirebaseFirestore.instance
        .collection(FirebaseCollection.flashcardSet.name)
        .snapshots();
    userUid = FirebaseAuth.instance.currentUser!.uid;
    loading = false;
    notifyListeners();
  }

  var listFlashcard = [];
}
