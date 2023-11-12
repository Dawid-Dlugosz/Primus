import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/flashcard_set.dart';
import '../model/unit.dart';

class UnitScreenViewModel extends ChangeNotifier {
  UnitScreenViewModel({required this.unit}) {
    _init();
  }

  final Unit unit;
  bool loaded = false;
  List<FlashCardSet> flashcardSets = [];

  void _init() async {
    for (var element in unit.sets) {
      var document = await FirebaseFirestore.instance.doc(element).get();
      var data = document.data();
      flashcardSets.add(FlashCardSet.fromJson(data!));
    }

    loaded = true;
    notifyListeners();
  }
}
