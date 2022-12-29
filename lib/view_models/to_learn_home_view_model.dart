import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/model/user.dart' as user;

class ToLearnHomeViewModel extends ChangeNotifier {
  ToLearnHomeViewModel(this.context) {
    _init();
  }

  final BuildContext context;

  bool loaded = false;

  late String uid;

  Future<void> _init() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    loaded = true;
    notifyListeners();
  }

  Future<List<ToLearn>> getUserToLearn() async {
    List<ToLearn> toLearn = [];

    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();

    toLearn.addAll(user.User.fromJson(document.data() as Map<String, dynamic>).toLearn ?? []);

    return toLearn;
  }

  Future<void> deleteToLearn(String flashcardId) async {
    Navigator.pop(context);
    loaded = false;
    notifyListeners();

    var currentUserDocument = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    var currentUser = user.User.fromJson(currentUserDocument.data()!);

    var toLearn = currentUser.toLearn;
    toLearn!.removeWhere((element) => element.flashcardId == flashcardId);

    currentUser = currentUser.copyWith(toLearn: toLearn);

    await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).update({'toLearn': toLearn.map((e) => e.toJson()).toList()});

    loaded = true;
    notifyListeners();
  }
}
