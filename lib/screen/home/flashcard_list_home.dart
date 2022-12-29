import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/screen/show_all/all_flascard.dart';
import 'package:primus/widgets/card_flashcard.dart';

class FlashcardListHome extends StatefulWidget {
  const FlashcardListHome({required this.flashcards, required this.uid, required this.delte, Key? key}) : super(key: key);

  final List<Flashcard> flashcards;
  final String uid;
  final Function(String flashcardId) delte;
  @override
  State<FlashcardListHome> createState() => _FlashcardListStateHome();
}

class _FlashcardListStateHome extends State<FlashcardListHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sets),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.flashcards.take(3).length,
          itemBuilder: (context, index) {
            return CardFlashcard(
              flashcard: widget.flashcards[index],
              delete: widget.delte,
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllFlashcard(widget.flashcards)));
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        ),
      ],
    );
  }
}
