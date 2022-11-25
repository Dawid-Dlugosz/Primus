class LearnMethod {
  LearnMethod({required this.flashcard, required this.spelling, required this.test});

  final bool flashcard;
  final bool spelling;
  final bool test;

  factory LearnMethod.fromJson(Map<String, dynamic> json) {
    return LearnMethod(flashcard: json['flashcard'], spelling: json['spelling'], test: json['test']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['flashcard'] = flashcard;
    json['spelling'] = spelling;
    json['test'] = test;
    return json;
  }

  LearnMethod copyWith({bool? flashcard, bool? spelling, bool? test}) => LearnMethod(
        flashcard: flashcard ?? this.flashcard,
        spelling: spelling ?? this.spelling,
        test: test ?? this.test,
      );
}
