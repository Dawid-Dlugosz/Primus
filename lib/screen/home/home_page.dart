import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/user.dart' as myUser;
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/screen/home/flashcard_list_home.dart';
import 'package:primus/utils/firebase_error.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/empty_widget.dart';
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
      return viewModel.loaded
          ? Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    const Text('Primus'),
                    IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(Icons.gamepad_rounded),
                    )
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
                child: StreamBuilder<DocumentSnapshot>(
                  stream: viewModel.document,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null && snapshot.data!.data() != null) {
                      var value = snapshot.data!.data() as Map<String, dynamic>;
                      if (value['ownFlashcard'] == null) {
                        return const EmptyWidget();
                      }

                      myUser.User user = myUser.User.fromJson(value);

                      return FutureBuilder<List<Flashcard>>(
                        future: viewModel.getUserFlahscards(user.ownFlashcard),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const LoadingWidget();
                          }
                          if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                            return FlashcardListHome(
                              flashcards: snapshot.data!,
                              uid: viewModel.uid,
                            );
                          }
                          return const EmptyWidget();
                        },
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
