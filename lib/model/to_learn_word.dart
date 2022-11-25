import 'package:primus/model/learn_method.dart';
import 'package:primus/model/word.dart';

class ToLearnWord {
  ToLearnWord({required this.word, required this.learnMethod});

  final LearnMethod learnMethod;
  final Word word;
  factory ToLearnWord.fromJson(Map<String, dynamic> json) {
    return ToLearnWord(word: Word.fromJson(json['word']), learnMethod: LearnMethod.fromJson(json['learnMethod']));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['learnMethod'] = learnMethod.toJson();
    json['word'] = word.toJson();
    return json;
  }

  ToLearnWord copyWith({LearnMethod? learnMethod, Word? word}) => ToLearnWord(
        word: word ?? this.word,
        learnMethod: learnMethod ?? this.learnMethod,
      );
}
