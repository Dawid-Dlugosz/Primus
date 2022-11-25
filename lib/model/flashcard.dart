import 'package:primus/model/word.dart';

class Flashcard {
  Flashcard({required this.id, required this.languageSet, required this.nameSet, required this.words, required this.timeStamp});

  final String id;
  final String languageSet;
  final String nameSet;
  final int timeStamp;
  final List<Word> words;

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'],
      languageSet: json['languageSet'],
      nameSet: json['nameSet'],
      words: (json['words'] as List<dynamic>).map((e) => Word.fromJson(e)).toList(),
      timeStamp: json['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['languageSet'] = languageSet;
    json['nameSet'] = nameSet;
    json['timeStamp'] = timeStamp;
    json['words'] = words.map((e) => e.toJson()).toList();
    return json;
  }
}
