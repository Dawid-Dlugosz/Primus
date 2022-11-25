import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/widgets/card_flashcard.dart';

class FlashcardListHome extends StatefulWidget {
  const FlashcardListHome({required this.flashcards, required this.uid, Key? key}) : super(key: key);

  final List<Flashcard> flashcards;
  final String uid;

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
              // uid: widget.uid,
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // TODO Przenoszenie do listy gdzie są wszystkie zestawy
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        ),
      ],
    );
  }
}
