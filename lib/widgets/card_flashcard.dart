import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_main.dart';
import 'package:primus/screen/preview_flashcard.dart';
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
    return InkWell(
      onTap: () => {
        if (widget.fromSearch)
          {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ChangeNotifierProvider(
            //       create: (context) => FlashcardMainViewModel(uid: widget.uid, setName: widget.flashcard.nameSet),
            //       child: const FlashCardMain(),
            //     ),
            //   ),
            // )

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PreviewFlashcard(),
            //   ),
            // )
          }
        else
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => FlashcardMainViewModel(flascardId: widget.flashcard.id),
                  child: const FlashCardMain(),
                ),
              ),
            )
          }
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppLocalizations.of(context)!.nameFlashcardSet(flashcardName)),
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
      ),
    );
  }
}
