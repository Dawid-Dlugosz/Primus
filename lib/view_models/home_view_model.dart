import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/screen/search/search.dart';
import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/bottom_dialog_add.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context) {
    _init();
  }

  final BuildContext context;

  bool loading = false;

  void _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    document = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(uid).snapshots();
  }

  late String uid;

  late Stream<DocumentSnapshot> document;

  void showBottomDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const BottomDialogAdd();
      },
    );
  }

  // return ChangeNotifierProvider<LanguageProvider>(

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
}
