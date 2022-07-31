class Flashcard {
  Flashcard(this.word, this.definition);

  final String word;
  final String definition;

  Map<String, String> toJson() {
    Map<String, String> json = {};
    json['word'] = word;
    json['definition'] = definition;
    return json;
  }
}
