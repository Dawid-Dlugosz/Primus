import 'package:flutter/material.dart';
import 'package:primus/features/create_flashcard/data/models/flash_word.dart';

abstract class FlashcardRepository {
  FlashWord createFlashWord({
    required String word,
    required String definition,
    required BuildContext context,
  });

  List<FlashWord> deleteFlashWord({
    required int index,
    required List<FlashWord> flashWords,
  });
}
