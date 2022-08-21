import 'package:primus/model/word.dart';
import 'package:primus/utils/firestoreNames.dart';

class Flashcard {
  Flashcard({required this.languageSet, required this.nameSet, required this.words, required this.timeStamp});

  final String languageSet;
  final String nameSet;
  final int timeStamp;
  final List<Word> words;

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(languageSet: json[languageSetString], nameSet: json[nameSetString], words: (json[wordsString] as List<dynamic>).map((e) => Word.fromJson(e)).toList(), timeStamp: json[timeStampString]);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json[languageSetString] = languageSet;
    json[nameSetString] = nameSet;
    json[timeStampString] = timeStamp;
    json[wordsString] = words.map((e) => e.toJson()).toList();
    return json;
  }
}
