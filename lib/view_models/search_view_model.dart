import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/utils/firestoreNames.dart';

class SeachViewModel extends ChangeNotifier {
  SeachViewModel() {
    _init();
  }

  bool loading = false;

  late QuerySnapshot<Map<String, dynamic>> documents;
  void _init() async {
    loading = true;
    notifyListeners();

    documents = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).get();
    var docs = documents.docs;
    for (var element in docs) {
      var data = element.data();
      print('${data['uid']}');
    }

    // TODO ZASTANOWIĆ SIĘ CO BĘDZIE LEPSZE SNAPSHOT CZY POBIERANIE LISTY ZA KAZDYM RAZEM
    loading = false;
    notifyListeners();
  }

  void searchFlashcard(String value) async {
    // TODO ZROBIĆ WYSZUKIWARKE
  }
}
