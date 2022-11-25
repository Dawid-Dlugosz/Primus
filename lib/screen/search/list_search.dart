import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primus/model/flashcard.dart';

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

    viewModel.search(widget.snapshots.data!.docs, widget.nameSet);

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.listFlashcard.length,
        itemBuilder: (context, index) {
          return CardFlashcard(
            flashcard: viewModel.listFlashcard[index]['flashcard'],
            fromSearch: true,
          );
        },
      ),
    );
  }
}
