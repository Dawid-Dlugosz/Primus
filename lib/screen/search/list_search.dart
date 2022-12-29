import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard_set.dart';

import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:primus/widgets/empty_widget.dart';
import 'package:provider/provider.dart';

class ListSearch extends StatelessWidget {
  const ListSearch(this.snapshots, this.nameSet, {Key? key}) : super(key: key);
  final AsyncSnapshot<QuerySnapshot> snapshots;
  final String nameSet;

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SeachViewModel>(context, listen: false);

    List<FlashCardSet> getSearcherSets() {
      List<FlashCardSet> flashcardSet = [];
      for (var element in snapshots.data!.docs) {
        if ((element.data() as Map<String, dynamic>)['owner'] != viewModel.userUid) {
          var flascardSet = FlashCardSet.fromJson(element.data() as Map<String, dynamic>);
          if (flascardSet.flashcard.nameSet.contains(viewModel.name)) {
            flashcardSet.add(flascardSet);
          }
        }
      }

      return flashcardSet;
    }

    return getSearcherSets().isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: getSearcherSets().length,
              itemBuilder: (context, index) {
                return CardFlashcard(
                  flashcard: getSearcherSets()[index].flashcard,
                  fromSearch: true,
                );
              },
            ),
          )
        : const EmptyWidget();
  }
}
