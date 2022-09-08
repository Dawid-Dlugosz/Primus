import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/view_models/search_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:primus/widgets/error_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SeachViewModel model;

  @override
  void dispose() {
    model.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeachViewModel>(builder: (_, viewModel, __) {
      model = viewModel;
      GlobalKey<FormState> xx = GlobalKey<FormState>();
      if (!viewModel.loading) {
        return Scaffold(
          appBar: AppBar(
            title: Text('dawdaw'),
          ),
          body: Form(
            key: xx,
            child: Column(
              children: [
                TextFormField(
                  controller: viewModel.textEditingController,
                  decoration: InputDecoration.collapsed(
                    hintText: AppLocalizations.of(context)!.flashcardsName,
                    border: const OutlineInputBorder(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.flashcards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardFlashcard(flashcard: viewModel.flashcards[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return LoadingWidget();
      }
    });
  }
}
