import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/to_learn.dart';
import 'package:primus/model/user.dart' as myUser;
import 'package:primus/screen/home/flashcard_list_home.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/error_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:primus/widgets/to_learn_list/to_learn_home_list.dart';
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
                      icon: const Icon(Icons.gamepad_rounded),
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

                      myUser.User user = myUser.User.fromJson(value);
                      user.toLearn?.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
                      return ListView(
                        children: [
                          // TO LEARN LIST
                          StreamBuilder<List<ToLearn>>(
                            stream: Stream.fromFuture(viewModel.getUserToLearn()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const LoadingWidget();
                              }
                              if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                                return ToLearnHomeList(
                                  toLearn: snapshot.data!,
                                  delete: viewModel.deleteToLearn,
                                );
                              }
                              return Container();
                            },
                          ),
                          // SET LSIT
                          user.ownFlashcard != null
                              ? StreamBuilder<List<Flashcard>>(
                                  stream: Stream.fromFuture(viewModel.getUserFlahscards(user.ownFlashcard)),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const LoadingWidget();
                                    }
                                    if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                                      return FlashcardListHome(
                                        flashcards: snapshot.data!,
                                        delte: viewModel.deleteFlashcard,
                                        uid: viewModel.uid,
                                      );
                                    }
                                    return Container();
                                  })
                              : Container()
                        ],
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
