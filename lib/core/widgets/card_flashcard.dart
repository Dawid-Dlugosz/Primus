import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:primus/features/create_flashcard/data/repository/create_flash_card_repository_impl.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/cud_flashcard_cubit.dart';

import '../../dialog/delete_flashcard.dart';
import '../../features/create_flashcard/presentation/screens/create_flashcard_page.dart';

class CardFlashcard extends StatelessWidget {
  const CardFlashcard({
    required this.flashcard,
    this.fromSearch = false,
    super.key,
  });

  final FlashCard flashcard;
  final bool fromSearch;

  @override
  Widget build(BuildContext context) {
    final flashcardName = flashcard.nameSet;
    final wordsCount = flashcard.words.length;
    final dt = DateTime.fromMillisecondsSinceEpoch(flashcard.timeStamp);
    final date = DateFormat('dd-MM-yy').format(dt);

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO SHOW FLASHCARD
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ChangeNotifierProvider(
            //       create: (context) =>
            //           FlashcardMainViewModel(flascardId: widget.flashcard.id),
            //       child: const FlashCardMain(),
            //     ),
            //   ),
            // );
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!
                        .nameFlashcardSet(flashcardName)),
                    !fromSearch
                        ? PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'Edit',
                                child: Text(AppLocalizations.of(context)!.edit),
                              ),
                              PopupMenuItem(
                                value: 'Delete',
                                child:
                                    Text(AppLocalizations.of(context)!.delete),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'Edit') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                      create: (_) => CUDFlashcardCubit(
                                        flashcardRepository:
                                            FlashCardRepositoryImpl(
                                          firestore: FirebaseFirestore.instance,
                                          authUserId: FirebaseAuth
                                              .instance.currentUser!.uid,
                                        ),
                                      )..setFlashcardSetToEdit(
                                          flashcardSetId: flashcard.id,
                                        ),
                                      child: const CreateFlashcardPage(),
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) => BlocProvider(
                                    create: (context) => CUDFlashcardCubit(
                                      flashcardRepository:
                                          FlashCardRepositoryImpl(
                                        firestore: FirebaseFirestore.instance,
                                        authUserId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                      ),
                                    ),
                                    child: DeleteFlashcard(
                                      flashcardId: flashcard.id,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Icon(Icons.more_vert),
                          )
                        : Container(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.lastUpdate(date)),
                    Text(AppLocalizations.of(context)!
                        .flashCardWordsCount(wordsCount)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
