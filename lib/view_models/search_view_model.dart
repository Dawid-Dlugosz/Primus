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

  late Stream<QuerySnapshot<Map<String, dynamic>>> documents;
  late CollectionReference<Map<String, dynamic>> dd;
  late String uid;

  List<Flashcard> flashcards = [];
  void _init() async {
    loading = true;
    notifyListeners();

    textEditingController.addListener(() {
      searchFlashcard();
    });

    documents = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).snapshots();
    dd = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name);
    uid = FirebaseAuth.instance.currentUser!.uid;
    loading = false;
    notifyListeners();
  }

  void searchFlashcard() {
    print("dawdaw");
    dd.get().then((value) {
      for (var element in value.docs) {
        // print("adaawd");
        // var x = value.docs;
        var flashcardSet = FlashCardSet.fromJson(element.data());
        if (flashcardSet.uid != uid) {
          flashcards = flashcardSet.flashcards.where((element) => element.nameSet.contains(textEditingController.text)).toList();
        }
        print("uid: ${flashcardSet.uid}");

        // x.forEach((element) {
        // print('dadaw ${element.data() as Map<String, dynamic>}');
        // });
        // print("dd: ${element['flashcard']}");

        // print("adadaw :${x}");
        // x.forEach((element) {
        //   element.flashcards.forEach((element) {

        //   });
        // });
      }
    });
  }
}
