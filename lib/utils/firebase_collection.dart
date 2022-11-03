import 'package:primus/model/flashcard.dart';
import 'package:primus/model/splitWords.dart';
import 'package:primus/model/word.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

SplitWords splitWords({required List<Flashcard> flashcards, required String nameSet}) {
  List<Word> hlpKnow = [];
  List<Word> hlpUnknow = [];
  var flashcard = flashcards.where((element) => element.nameSet == nameSet).first;

  for (var element in flashcard.words) {
    var widget = FLipFlashcard(
      wordDefinition: element.definition,
      word: element.word,
      language: flashcard.languageSet,
    );

    if (element.learModes.isEmpty || element.learModes.containsValue(false)) {
      hlpUnknow.add(element);
    } else {
      hlpKnow.add(element);
    }
  }

  return SplitWords(
    allKnowWords: hlpKnow,
    allUnknowWords: hlpUnknow,
  );
}
