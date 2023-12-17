import 'package:flutter/material.dart';
import 'package:primus/core/widgets/card_flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';

class FlashcardSetList extends StatelessWidget {
  const FlashcardSetList({required this.flashcardSets, super.key});
  final List<FlashcardSet> flashcardSets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flashcardSets.length,
      itemBuilder: (_, index) {
        return CardFlashcard(
          flashcardSet: flashcardSets[index],
        );
      },
    );
  }
}
