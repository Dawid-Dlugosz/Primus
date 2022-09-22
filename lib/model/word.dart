import 'package:primus/utils/firestoreNames.dart';

class Word{
  Word({required this.word, required this.definition});
  final String word;
  final String definition;

  factory Word.fromJson(Map<String, dynamic> json){
    return Word(word: json[wordString], definition: json[definitionString]);
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};
    json[wordString] = word;
    json[definitionString] = definition;
    return json;
  }
}