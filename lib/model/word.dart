class Word {
  Word({required this.word, required this.definition, this.knowCount = 0});
  final String word;
  final String definition;

  /// if knowCount is equals knowThreshold for FlashcardSet then this flashcard
  /// is counted as known
  final int knowCount;

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      definition: json['definition'],
      knowCount: json['knowCount'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['word'] = word;
    json['definition'] = definition;
    return json;
  }
}
