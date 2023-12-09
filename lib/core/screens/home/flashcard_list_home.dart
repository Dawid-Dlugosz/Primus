import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'show_all/all_flascard.dart';
import '../../widgets/card_flashcard.dart';

class FlashcardListHome extends StatefulWidget {
  const FlashcardListHome({
    required this.flashcardsSets,
    super.key,
  });

  final List<FlashcardSet> flashcardsSets;

  @override
  State<FlashcardListHome> createState() => _FlashcardListHomeState();
}

class _FlashcardListHomeState extends State<FlashcardListHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sets),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.flashcardsSets.take(3).length,
          itemBuilder: (context, index) {
            // TODO PORPAWIĆ USUSWANIE U KAŻDEGO UŻYTKOWNIKA KTÓRY W TO LEARN MA ID USUWANEGO ZESTAWU MUSI ZOSTAĆ USUNIĘTE
            return CardFlashcard(
              flashcard: widget.flashcardsSets[index].flashCard,
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllFlashcard(),
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        ),
      ],
    );
  }
}
