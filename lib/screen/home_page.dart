import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (_, viewModel, __) {
      return !viewModel.loading
          ? Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Primus'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  viewModel.showBottomDialog();
                },
                child: const Icon(Icons.add),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: viewModel.document,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var value = snapshot.data!.data() as Map<String, dynamic>;
                      FlashCardSet flashCardSet = FlashCardSet.fromJson(value);
                      var flashcardList = flashCardSet.flashcards;
                      flashcardList.sort((a, b) => b.timeStamp - a.timeStamp);
                      return ListView.builder(
                        itemCount: flashcardList.take(3).length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardFlashcard();
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
          : const LoadingWidget();
    });
  }
}
