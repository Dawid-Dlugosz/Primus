import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'show_all/all_flascard.dart';
import '../../widgets/card_flashcard.dart';

class FlashcardListHome extends StatelessWidget {
  const FlashcardListHome({
    required this.flashcardsSets,
    super.key,
  });

  final List<FlashcardSet> flashcardsSets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sets),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: flashcardsSets.take(3).length,
          itemBuilder: (context, index) {
            return CardFlashcard(
              flashcardSet: flashcardsSets[index],
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
