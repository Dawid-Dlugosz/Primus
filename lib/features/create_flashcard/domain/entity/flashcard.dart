import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
class FlashCard with _$FlashCard {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory FlashCard({
    required String id,
    required String languageSet,
    required String nameSet,
    required int timeStamp,
    required List<Word> words,
  }) = _FlashCard;

  factory FlashCard.fromJson(Map<String, dynamic> json) =>
      _$FlashCardFromJson(json);
}
