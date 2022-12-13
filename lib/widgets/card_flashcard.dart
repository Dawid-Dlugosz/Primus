import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:primus/model/edit_flashcard_view_model.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/screen/edit_flashcard.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_main.dart';
import 'package:primus/view_models/flashcard_main_view_model.dart';
import 'package:provider/provider.dart';

class CardFlashcard extends StatefulWidget {
  const CardFlashcard({required this.flashcard, this.fromSearch = false, Key? key}) : super(key: key);

  final Flashcard flashcard;
  final bool fromSearch;

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
    return SizedBox(
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
                  Text(AppLocalizations.of(context)!.nameFlashcardSet(flashcardName)),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'Edit',
                        child: Text('Edytuj'),
                      ),
                      const PopupMenuItem(
                        value: 'Delete',
                        child: Text('Usuń'),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'Edit') {
                        Navigator.push(
                          this.context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => EditFlashcardViewModel(flashcard: widget.flashcard, context: context),
                              child: const EditFlascard(),
                            ),
                          ),
                        );
                      } else {
                        // TODO DELETE SCREEN
                      }
                    },
                    child: const Icon(Icons.more_vert),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.lastUpdate(date)),
                  Text(AppLocalizations.of(context)!.flashCardWordsCount(wordsCount)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
