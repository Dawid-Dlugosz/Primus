import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/screen/home/flashcard_list_home.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/error_widget.dart';
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
                title: Row(
                  children: [
                    Text('Primus'),
                    IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        icon: Icon(Icons.gamepad_rounded))
                  ],
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'seach',
                    onPressed: () {
                      viewModel.navigateToSearch();
                    },
                    child: const Icon(Icons.search_rounded),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    heroTag: 'add',
                    onPressed: () {
                      viewModel.showBottomDialog();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: viewModel.document,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null && snapshot.data!.data() != null) {
                      var value = snapshot.data!.data() as Map<String, dynamic>;
                      if (value.isEmpty) {
                        // TODO Zrobić empty widget
                        return Text('Zrobić tak, żeby przy rejestracji konta odrazu tworzyć pusty dokument w flashcards, dotatkowo kiedy nie ma czego wyszukać w wyszukiwarce jakoś to obsłużyć');
                      }
                      FlashCardSet flashCardSet = FlashCardSet.fromJson(value);
                      var flashcardList = flashCardSet.flashcards;
                      flashcardList.sort((b, a) => a.timeStamp.compareTo(b.timeStamp));
                      return FlashcardListHome(
                        flashcards: flashcardList,
                        uid: viewModel.uid,
                      );
                    }

                    return const CustomErrorWidget();
                  },
                ),
              ),
            )
          : const LoadingWidget();
    });
  }
}
