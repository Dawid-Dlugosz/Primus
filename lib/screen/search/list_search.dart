import 'package:flutter/material.dart';
import '../../features/create_flashcard/domain/entity/flashcard_set.dart';

import '../../core/widgets/card_flashcard.dart';

class ListSearch extends StatelessWidget {
  const ListSearch({
    required this.flashcardSets,
    super.key,
  });
  final List<FlashcardSet> flashcardSets;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: flashcardSets.length,
        itemBuilder: (context, index) {
          return CardFlashcard(
            flashcardSet: flashcardSets[index],
            fromSearch: true,
          );
        },
      ),
    );
  }
}
