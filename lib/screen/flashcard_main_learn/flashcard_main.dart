import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/author_name/data/repository/author_name_repository_impl.dart';
import 'package:primus/features/author_name/presentation/author_name/author_name_cubit.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/learn_method/presentation/cubit/flashcard/flashcard_learn_cubit.dart';
import 'package:primus/features/learn_method/presentation/cubit/single_choice_test/single_choice_test_cubit.dart';
import 'package:primus/features/learn_method/presentation/cubit/spelling/spelling_cubit.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_learn.dart';

import '../../dialog/copy_flashcard.dart';
import '../../features/author_name/presentation/widgets/author_widget.dart';
import '../../widgets/go_to_learn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../flashcard_spelling.dart';
import '../test/flashcard_exam.dart';
import 'flashcard_vocabulary.dart';

class FlashCardMain extends StatelessWidget {
  const FlashCardMain({required this.flashcardSet, super.key});
  final FlashcardSet flashcardSet;

  void checkIsContain(BuildContext context) {
    if (!context.read<UserCubit>().containtFlashcardSet(
          flashcardSetId: flashcardSet.flashCard.id,
        )) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return CopyFlashcard(
            flashcardSet: flashcardSet,
          );
        },
      ).then((value) {
        if (value as bool) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => FlashcardLearnCubit(
                  user: context.read<UserCubit>(),
                  language: flashcardSet.flashCard.languageSet,
                  flashcardSetId: flashcardSet.flashCard.id,
                )..initial(),
                child: const FlashcardLearn(),
              ),
            ),
          );
        }
      });
    } else {
      if (!context
          .read<UserCubit>()
          .hasCopyFlashcard(flashcardSetId: flashcardSet.flashCard.id)) {
        context.read<UserCubit>().copyFlashcard(flashcardSet: flashcardSet);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => FlashcardLearnCubit(
                user: context.read<UserCubit>(),
                language: flashcardSet.flashCard.languageSet,
                flashcardSetId: flashcardSet.flashCard.id,
              )..initial(),
              child: const FlashcardLearn(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flashcardSet.flashCard.nameSet),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            !context.watch<UserCubit>().containtFlashcardSet(
                      flashcardSetId: flashcardSet.flashCard.id,
                    )
                ? BlocProvider(
                    create: (context) => AuthorNameCubit(
                      repository: AuthorNameRepositoryImpl(
                        firestore: FirebaseFirestore.instance,
                      ),
                    )..getAuthorName(uid: flashcardSet.ownerId),
                    child: AuthorWidget(
                      flashcardSet: flashcardSet,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)!.learnedWord,
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!.unknowWord,
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    FlashcardVocabulary(
                      language: flashcardSet.flashCard.languageSet,
                    ),
                    Expanded(
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          GoToLearn(
                            iconData: Icons.copy_rounded,
                            text: AppLocalizations.of(context)!.flashcards,
                            learnMode: () async {
                              checkIsContain(context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GoToLearn(
                            iconData: Icons.ballot_outlined,
                            text: AppLocalizations.of(context)!.test,
                            learnMode: () async {
                              checkIsContain(context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GoToLearn(
                            iconData: Icons.spellcheck_outlined,
                            text: AppLocalizations.of(context)!.spelling,
                            learnMode: () async {
                              checkIsContain(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
