import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/utils/firestoreNames.dart';

class SeachViewModel extends ChangeNotifier {
  SeachViewModel() {
    _init();
  }
  TextEditingController textEditingController = TextEditingController();
  bool loading = false;

  late Stream<QuerySnapshot<Map<String, dynamic>>> snapshot;
  late CollectionReference<Map<String, dynamic>> document;
  late String uid;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> x;

  var name = '';
  List<Flashcard> flashcards = [];
  void _init() async {
    loading = true;
    notifyListeners();
    snapshot = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).snapshots();
    uid = FirebaseAuth.instance.currentUser!.uid;
    loading = false;
    notifyListeners();
  }

  List<Flashcard> searchFlashcard(List flashcardJson, String nameSet) {
    var list = <Flashcard>[];
    for (var element in flashcardJson) {
      var helpElement = element[nameSetString].toString().toLowerCase();
      if (helpElement.startsWith(textEditingController.text.toLowerCase())) {
        list.add(Flashcard.fromJson(element));
      }
    }
    return list;
  }
}
