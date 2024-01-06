import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../enum/collection.dart';
import '../../features/user/presentation/cubit/cubit/user_cubit.dart';
import '../../features/vocabulary/data/repository/vocabulary_repository_impl.dart';
import '../../features/vocabulary/presentation/vocabulary/vocabulary_cubit.dart';
import '../../screen/flashcard_main_learn/flashcard_main.dart';

class CardToLearn extends StatelessWidget {
  const CardToLearn({
    required this.toLearn,
    super.key,
  });

  final ToLearn toLearn;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection(FirebaseCollection.flashcardSet.name)
                .doc(toLearn.flashcardId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.data != null && snapshot.data!.exists) {
                final flashcardSet =
                    FlashcardSet.fromJson(snapshot.data!.data()!);
                final dt =
                    DateTime.fromMillisecondsSinceEpoch(toLearn.timeStamp);
                final date = DateFormat('dd-MM-yy').format(dt);
                final wordLenght = toLearn.words.length;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (context) => VocabularyCubit(
                            repository: VocabularyRepositoryImpl(
                              firestore: FirebaseFirestore.instance,
                            ),
                          )..getVocabulary(
                              user: context.read<UserCubit>(),
                              flashcardSetId: flashcardSet.flashCard.id,
                            ),
                          child: FlashCardMain(
                            flashcardSet: flashcardSet,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppLocalizations.of(context)!.nameFlashcardSet(
                                flashcardSet.flashCard.nameSet)),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'Delete',
                                  child: Text(
                                      AppLocalizations.of(context)!.delete),
                                ),
                              ],
                              onSelected: (value) {
                                if (value == 'Delete') {
                                  context.read<UserCubit>().deleteToLearn(
                                        flashcardSetId:
                                            flashcardSet.flashCard.id,
                                      );
                                }
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                AppLocalizations.of(context)!.lastUpdate(date)),
                            Text(AppLocalizations.of(context)!
                                .flashCardWordsCount(wordLenght)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
