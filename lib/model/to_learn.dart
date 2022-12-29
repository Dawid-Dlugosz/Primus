import 'package:primus/model/to_learn_word.dart';

class ToLearn {
  const ToLearn({
    required this.flashcardId,
    required this.words,
    required this.timeStamp,
  });

  final String flashcardId;
  final List<ToLearnWord> words;
  final int timeStamp;

  factory ToLearn.fromJson(Map<String, dynamic> json) {
    return ToLearn(
      flashcardId: json['flashcardId'],
      words: (json['words'] as List<dynamic>).map((e) => ToLearnWord.fromJson(e)).toList(),
      timeStamp: json['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcardId'] = flashcardId;
    json['words'] = words.map((e) => e.toJson()).toList();
    json['timeStamp'] = timeStamp;
    return json;
  }

  ToLearn copyWith({String? flashcardId, List<ToLearnWord>? words, int? timeStamp}) => ToLearn(
        flashcardId: flashcardId ?? this.flashcardId,
        words: words ?? this.words,
        timeStamp: timeStamp ?? this.timeStamp,
      );
}
