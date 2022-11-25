import 'package:primus/model/flashcard.dart';

class FlashCardSet {
  FlashCardSet({required this.flashcard, required this.owner});

  final Flashcard flashcard;
  final String owner;

  factory FlashCardSet.fromJson(Map<String, dynamic> json) {
    return FlashCardSet(
      flashcard: Flashcard.fromJson(json['flashcard']),
      owner: json['owner'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcard'] = flashcard.toJson();
    json['owner'] = owner;
    return json;
  }
}
