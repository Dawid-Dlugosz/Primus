import 'package:flutter/material.dart';
import 'package:primus/features/create_flashcard/data/models/flash_word.dart';
import 'package:primus/features/create_flashcard/domain/repository/flashcard_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashRepositoryImpl implements FlashcardRepository {
  @override
  FlashWord createFlashWord({
    String? word,
    String? definition,
    required BuildContext context,
  }) {
    final wordController = TextEditingController();
    final definitionController = TextEditingController();
    if (word != null) {
      wordController.text = word;
    }
    if (definition != null) {
      definitionController.text = definition;
    }
    final wordTextField = TextFormField(
      controller: wordController,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.wordHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.flashcardsNameError;
        }
        return null;
      },
    );

    var definitionTextField = TextFormField(
      controller: definitionController,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.definitionHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.flashcardsNameError;
        }
        return null;
      },
    );
    return FlashWord(
      wordField: wordTextField,
      definitionField: definitionTextField,
    );
  }

  @override
  List<FlashWord> deleteFlashWord({
    required int index,
    required List<FlashWord> flashWords,
  }) {
    final tmpFlashwords = [...flashWords];
    tmpFlashwords.removeAt(index);
    return tmpFlashwords;
  }
}
