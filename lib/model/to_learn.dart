import 'package:primus/model/to_learn_word.dart';
import 'package:primus/model/word.dart';

class ToLearn {
  const ToLearn({
    required this.flashcardId,
    required this.words,
  });

  final String flashcardId;
  final List<ToLearnWord> words;

  factory ToLearn.fromJson(Map<String, dynamic> json) {
    return ToLearn(
      flashcardId: json['flashcardId'],
      words: (json['words'] as List<dynamic>).map((e) => ToLearnWord.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcardId'] = flashcardId;
    json['words'] = words.map((e) => e.toJson()).toList();
    return json;
  }

  ToLearn copyWith({String? flashcardId, List<ToLearnWord>? words}) => ToLearn(
        flashcardId: flashcardId ?? this.flashcardId,
        words: words ?? this.words,
      );
}
