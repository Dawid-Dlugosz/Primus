import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/core/screens/home/flashcard_list_home.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import '../../../../widgets/bottom_dialog_add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // TODO MAKE SEARCH SCREEN
              // viewModel.navigateToSearch();
            },
            child: const Icon(Icons.search_rounded),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const BottomDialogAdd();
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<UserFlashcardCubit, UserFlashcardState>(
              builder: (_, state) {
                return state.maybeMap(
                  loaded: (value) {
                    return FlashcardListHome(
                      flashcardsSets: value.flashcardSets,
                    );
                  },
                  orElse: () => Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                  ),
                );
              },
            )
          ],
        ),
        // child: StreamBuilder<DocumentSnapshot>(
        //   stream: viewModel.document,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData &&
        //         snapshot.data != null &&
        //         snapshot.data!.data() != null) {
        //       var value = snapshot.data!.data() as Map<String, dynamic>;

        //       myUser.User user = myUser.User.fromJson(value);
        //       user.toLearn?.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
        //       return ListView(
        //         children: [
        // TO LEARN LIST
        // StreamBuilder<List<ToLearn>>(
        //   stream: Stream.fromFuture(viewModel.getUserToLearn()),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const LoadingWidget();
        //     }
        //     if (snapshot.hasData &&
        //         snapshot.data != null &&
        //         snapshot.data!.isNotEmpty) {
        //       return ToLearnHomeList(
        //         toLearn: snapshot.data!,
        //         delete: viewModel.deleteToLearn,
        //       );
        //     }
        //     return Container();
        //   },
        // ),
        // SET LSIT
        //       user.ownFlashcard != null
        //           ? StreamBuilder<List<Flashcard>>(
        //               stream: Stream.fromFuture(
        //                   viewModel.getUserFlahscards(user.ownFlashcard)),
        //               builder: (context, snapshot) {
        //                 if (snapshot.connectionState ==
        //                     ConnectionState.waiting) {
        //                   return const LoadingWidget();
        //                 }
        //                 if (snapshot.hasData &&
        //                     snapshot.data != null &&
        //                     snapshot.data!.isNotEmpty) {
        //                   return FlashcardListHome(
        //                     flashcards: snapshot.data!,
        //                     delte: viewModel.deleteFlashcard,
        //                     uid: viewModel.uid,
        //                   );
        //                 }
        //                 return Container();
        //               })
        //           : Container(),
        //       StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        //         stream: viewModel.unitDocuments,
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData &&
        //               snapshot.data != null &&
        //               snapshot.data!.docs.isNotEmpty) {
        //             return UnitHomeList(
        //               units: viewModel.getUnits(snapshot.data!),
        //               delete: viewModel.deleteUnit,
        //             );
        //           }
        //           return Container();
        //         },
        //       ),
        //     ],
        //   );
        // }
        // return const CustomErrorWidget();
        // },
        // ),
      ),
    );
  }
}
