const initalLearnMethod = <String, dynamic>{
  'flashcard': false,
  'spelling': false,
  'test': false,
};

class Word {
  Word({required this.word, required this.definition, required this.learModes});
  final String word;
  final String definition;

  /// List of learned mode map example: {'spelling': false} map contain all learn method
  /// and flag checks if the test is passed, if all method is set as true the word is considered known
  final Map<String, dynamic> learModes;

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      definition: json['definition'],
      learModes: json['learModes'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['word'] = word;
    json['definition'] = definition;
    json['learModes'] = learModes;
    return json;
  }
}
