import 'package:freezed_annotation/freezed_annotation.dart';

import 'to_learn_word.dart';

part 'to_learn.g.dart';
part 'to_learn.freezed.dart';

@freezed
class ToLearn with _$ToLearn {
  @JsonSerializable(explicitToJson: true)
  const factory ToLearn({
    required String flashcardId,
    required List<ToLearnWord> words,
    required int timeStamp,
  }) = _ToLearn;

  factory ToLearn.fromJson(Map<String, dynamic> json) =>
      _$ToLearnFromJson(json);
}
