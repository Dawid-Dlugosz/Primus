import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/unit.dart';
import 'package:primus/utils/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateUnitViewModel extends ChangeNotifier {
  CreateUnitViewModel(this.context, {this.unit}) {
    _init();
  }
  final BuildContext context;
  Unit? unit;

  bool loaded = false;
  late List<FlashCardSet> flashcards;
  late String uid;
  late AppLocalizations appLocalizations;

  List<FlashCardSet> flascardsAddToUnit = [];

  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;

    var locale = Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    appLocalizations = await AppLocalizations.delegate.load(locale);

    flashcards = await getAllSets();

    if (unit != null) {
      for (var element in unit!.sets) {
        await getSetsFromUnit(element);
      }
    }

    loaded = true;
    notifyListeners();
  }

  Future<List<FlashCardSet>> getAllSets() async {
    var flaschardSets = <FlashCardSet>[];
    var documents = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcardSet.name).where('owner', isEqualTo: uid).get();
    for (var element in documents.docs) {
      var data = element.data();
      flaschardSets.add(FlashCardSet.fromJson(data));
    }

    return flaschardSets;
  }

  void addToUnit(FlashCardSet flashCardSet) {
    if (flascardsAddToUnit.any((element) => element.flashcard.id == flashCardSet.flashcard.id)) {
      flascardsAddToUnit.removeWhere((element) => element.flashcard.id == flashCardSet.flashcard.id);
    } else {
      flascardsAddToUnit.add(flashCardSet);
    }

    notifyListeners();
  }

  Future<void> getSetsFromUnit(String setReference) async {
    var document = await FirebaseFirestore.instance.doc(setReference).get();
    var data = document.data();
    flascardsAddToUnit.add(FlashCardSet.fromJson(data!));
  }

  Future<void> editUnit(String name) async {
    loaded = false;
    notifyListeners();

    var units = await FirebaseFirestore.instance.collection(FirebaseCollection.unit.name).where('owner', isNotEqualTo: uid).where('name', isEqualTo: name).get();

    if (units.docs.isNotEmpty) {
      var snackBar = SnackBar(
        content: Text(appLocalizations.nameIsbusy),
        duration: const Duration(seconds: 4),
      );

      loaded = true;
      notifyListeners();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    var flashcardReference = <String>[];

    for (var element in flascardsAddToUnit) {
      var reference = 'flashcardSet/${element.flashcard.id}';
      flashcardReference.add(reference);
    }

    var newUnit = unit!.copyWith(name: name, sets: flashcardReference, timeStamp: DateTime.now().millisecondsSinceEpoch);

    await FirebaseFirestore.instance.collection(FirebaseCollection.unit.name).doc(newUnit.id).set(newUnit.toJson());

    var snackBar = SnackBar(
      content: Text(appLocalizations.editSuccess),
      duration: const Duration(seconds: 4),
    );

    loaded = true;

    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }

  Future<void> saveUnit(String name) async {
    loaded = false;
    notifyListeners();

    var units = await FirebaseFirestore.instance.collection(FirebaseCollection.unit.name).where('owner', isEqualTo: uid).where('name', isEqualTo: name).get();
    if (units.docs.isNotEmpty) {
      var snackBar = SnackBar(
        content: Text(appLocalizations.nameIsbusy),
        duration: const Duration(seconds: 4),
      );

      loaded = true;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }
    var flashcardReference = <String>[];

    for (var element in flascardsAddToUnit) {
      var reference = 'flashcardSet/${element.flashcard.id}';
      flashcardReference.add(reference);
    }

    var unit = Unit(
      owner: uid,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
      sets: flashcardReference,
      id: const Uuid().v4(),
      name: name,
    );

    await FirebaseFirestore.instance.collection(FirebaseCollection.unit.name).doc(unit.id).set(unit.toJson());

    var snackBar = SnackBar(
      content: Text(appLocalizations.createUnit),
      duration: const Duration(seconds: 4),
    );

    loaded = true;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
