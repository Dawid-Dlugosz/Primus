import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_main.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:provider/provider.dart';

class CardFlashcard extends StatefulWidget {
  const CardFlashcard({required this.flashcard, required this.uid, Key? key}) : super(key: key);

  final Flashcard flashcard;
  final String uid;
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => FlashcardLearnViewModel(flashcard: widget.flashcard, uid: widget.uid),
              child: const FlashCardMain(),
            ),
          ),
        )
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
