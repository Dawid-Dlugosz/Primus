import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primus/utils/firestoreNames.dart';
import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:provider/provider.dart';

class ListSearch extends StatefulWidget {
  const ListSearch(this.snapshots, this.nameSet, {Key? key}) : super(key: key);
  final AsyncSnapshot<QuerySnapshot> snapshots;
  final String nameSet;

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SeachViewModel>(context, listen: false);

    return Expanded(
      child: ListView.builder(
        itemCount: widget.snapshots.data!.docs.length,
        itemBuilder: (context, index) {
          var data = widget.snapshots.data!.docs[index].data() as Map<String, dynamic>;
          if (data[uidString] != viewModel.uid) {
            var listFlashcard = viewModel.searchFlashcard(data[flashcardString], widget.nameSet);
            return Column(
              children: [
                ...listFlashcard
                    .map(
                      (value) => CardFlashcard(
                        flashcard: value,
                        uid: data[uidString],
                      ),
                    )
                    .toList(),
              ],
            );
          }
          if (data.isEmpty) {}
          // TODO EMPTY SCREEN WIDGET
          return Container(
            child: Text('pusto'),
          );
        },
      ),
    );
  }
}
