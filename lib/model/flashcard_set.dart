import 'package:primus/model/flashcard.dart';

class FlashCardSet {
  FlashCardSet({required this.flashcards, required this.uid});

  final List<Flashcard> flashcards;
  final String uid;

  factory FlashCardSet.fromJson(Map<String, dynamic> json) {
    return FlashCardSet(
      flashcards: (json['flashcard'] as List).map((e) => Flashcard.fromJson(e as Map<String, dynamic>)).toList(),
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcard'] = flashcards.map((e) => e.toJson());
    json['uid'] = uid;
    return json;
  }
}
