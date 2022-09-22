import 'package:primus/model/flashcard.dart';
import 'package:primus/utils/firestoreNames.dart';

class FlashCardSet {
  FlashCardSet({required this.flashcards, required this.uid});

  final List<Flashcard> flashcards;
  final String uid;

  factory FlashCardSet.fromJson(Map<String, dynamic> json) {
    return FlashCardSet(flashcards: (json[flashcardString] as List).map((e) => Flashcard.fromJson(e as Map<String, dynamic>)).toList(), uid: json[uidString]);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json[flashcardString] = flashcards.map((e) => e.toJson());
    json[uidString] = uid;
    return json;
  }
}
