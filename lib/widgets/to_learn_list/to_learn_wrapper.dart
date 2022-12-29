import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/to_learn_list/to_learn_item.dart';
import 'package:provider/provider.dart';

class ToLearnWrapper extends StatefulWidget {
  const ToLearnWrapper({required this.toLearn, required this.delete, Key? key}) : super(key: key);
  final ToLearn toLearn;
  final Function(String flashcardId) delete;

  @override
  State<ToLearnWrapper> createState() => _ToLearnWrapperState();
}

class _ToLearnWrapperState extends State<ToLearnWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection(FirebaseCollection.flashcardSet.name).doc(widget.toLearn.flashcardId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        if (snapshot.data != null && snapshot.data!.exists) {
          var flashcardSet = FlashCardSet.fromJson(snapshot.data!.data()!);
          return ToLearnItem(
            flashcard: flashcardSet.flashcard,
            timeStamp: widget.toLearn.timeStamp,
            delete: widget.delete,
          );
        }

        return Container();
      },
    );
  }
}
