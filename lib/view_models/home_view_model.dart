import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/widgets/bottom_dialog_add.dart';
import 'package:primus/enum/collection.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context){
    _init();
  }

  final BuildContext context;

  bool loading = false;

  late String uid;
  late DocumentSnapshot document;
  late QuerySnapshot collection;
  void _init() async{
    uid = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(uid).get();

  }

  void showBottomDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BottomDialogAdd();
      },
    );
  }
}
