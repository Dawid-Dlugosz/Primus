import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import '../../dialog/delete_flashcard.dart';

class CardFlashcard extends StatefulWidget {
  const CardFlashcard({
    required this.flashcard,
    this.delete,
    this.fromSearch = false,
    super.key,
  });

  final FlashCard flashcard;
  final bool fromSearch;
  final Function(String flashcardId)? delete;
  @override
  State<CardFlashcard> createState() => _CardFlashcardState();
}

class _CardFlashcardState extends State<CardFlashcard> {
  var flashcardName = '';
  var wordsCount = 0;
  var date = '';

  @override
  void initState() {
    flashcardName = widget.flashcard.nameSet;
    wordsCount = widget.flashcard.words.length;
    var dt = DateTime.fromMillisecondsSinceEpoch(widget.flashcard.timeStamp);
    date = DateFormat('dd-MM-yy').format(dt);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
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
                    !widget.fromSearch
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
                                // TODO MAKE EDIT
                                // Navigator.push(
                                //   this.context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         ChangeNotifierProvider(
                                //       create: (context) => FlashcardViewModel(
                                //           context,
                                //           flashcard: widget.flashcard,
                                //           edit: true),
                                //       child: const CreateFlashcardPageWrapper(),
                                //     ),
                                //   ),
                                // );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => DeleteFlashcard(
                                      delete: () =>
                                          widget.delete!(widget.flashcard.id)),
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
