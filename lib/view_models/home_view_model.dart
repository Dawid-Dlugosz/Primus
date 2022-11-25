import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/screen/search/search.dart';
import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/widgets/bottom_dialog_add.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context) {
    _init();
  }

  final BuildContext context;

  bool loaded = false;

  late String uid;
  late Stream<DocumentSnapshot> document;

  void _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;

    document = FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).snapshots();
    loaded = true;
    notifyListeners();
  }

  void showBottomDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const BottomDialogAdd();
      },
    );
  }

  void navigateToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SeachViewModel>(
          create: (context) => SeachViewModel(),
          child: const Search(),
        ),
      ),
    );
  }

  Future<List<Flashcard>> getUserFlahscards(List<String>? ownFlashcard) async {
    List<Flashcard> flashcards = [];
    if (ownFlashcard == null || ownFlashcard.isEmpty) {
      return flashcards;
    }

    for (var element in ownFlashcard) {
      DocumentReference docRef = FirebaseFirestore.instance.doc(element);
      var document = await docRef.get();

      var flashcardSet = document.data() as Map<String, dynamic>;
      flashcards.add(FlashCardSet.fromJson(flashcardSet).flashcard);
    }
    flashcards.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
    return flashcards;
  }
}
