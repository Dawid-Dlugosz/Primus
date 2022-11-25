import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';

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
    snapshot = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).snapshots();
    userUid = FirebaseAuth.instance.currentUser!.uid;
    loading = false;
    notifyListeners();
  }

  var listFlashcard = [];

  void search(List<QueryDocumentSnapshot<Object?>> docs, String nameSet) {
    listFlashcard = [];
    // Simple json when hold flascard object and uid
    var helperJson = {};
    // list to hold all helperJson then add helperList to listFlashcard
    var helperList = [];
    // loop over all document
    for (var element in docs) {
      if (element.data() != null) {
        var flashcardSet = element.data() as Map<String, dynamic>;
        var uid = flashcardSet['uid'];

        if (flashcardSet['flashcard'] != null && uid != userUid) {
          var flashcard = flashcardSet['flashcard'] as List;
          // loop over filtered flashcard
          for (var element2 in flashcard) {
            var helpElement = element2['nameSet'].toString().toLowerCase();
            if (helpElement.startsWith(nameSet.toLowerCase())) {
              helperJson['uid'] = uid;
              helperJson['flashcard'] = Flashcard.fromJson(element2);
              helperList.add(helperJson);
            }
          }
          listFlashcard.addAll(helperList);
        }
      }
    }
  }
}
