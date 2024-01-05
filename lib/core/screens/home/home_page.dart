import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/core/screens/home/flashcard_list_home.dart';
import 'package:primus/core/screens/home/to_learn_list_home.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/search/data/repository/search_repository_impl.dart';
import 'package:primus/features/search/presentation/search/search_cubit.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import 'package:primus/screen/search/search.dart';
import '../../../../widgets/bottom_dialog_add.dart';
import '../../../features/user/presentation/cubit/cubit/user_cubit.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (_) => SearchCubit(
                      repository: SearchRepositoryImpl(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                    child: const Search(),
                  ),
                ),
              );
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
                  orElse: () => const LoadingWidget(),
                );
              },
            ),
            Builder(builder: (context) {
              final state = context.watch<UserCubit>().state;
              if (state == null) {
                return const SizedBox();
              }
              if (state.toLearn.isNotEmpty) {
                final newToLearn = [...state.toLearn];
                newToLearn.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
                return ToLearnListHome(
                  toLearns: newToLearn,
                );
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
