import 'package:primus/model/flashcard.dart';

class FlashCardSet {
  FlashCardSet({required this.flashcards, required this.uid, this.knowThreshold = 3});

  final List<Flashcard> flashcards;
  final String uid;
  final int knowThreshold;
  factory FlashCardSet.fromJson(Map<String, dynamic> json) {
    return FlashCardSet(
      flashcards: (json['flashcard'] as List).map((e) => Flashcard.fromJson(e as Map<String, dynamic>)).toList(),
      uid: json['uid'],
      knowThreshold: json['knowThreshold'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcard'] = flashcards.map((e) => e.toJson());
    json['uid'] = uid;
    json['knowThreshold'] = knowThreshold;
    return json;
  }
}
