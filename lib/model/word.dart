const initalLearnMethod = <String, dynamic>{
  'flashcard': false,
  'spelling': false,
  'test': false,
};

class Word {
  Word({required this.word, required this.definition, required this.id});

  final String id;
  final String word;
  final String definition;

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'],
      word: json['word'],
      definition: json['definition'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['word'] = word;
    json['definition'] = definition;
    return json;
  }

  Word copyWith({String? id, String? word, String? definition}) => Word(
        word: word ?? this.word,
        definition: definition ?? this.definition,
        id: id ?? this.id,
      );
}
