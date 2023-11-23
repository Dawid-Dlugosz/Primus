import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';

part 'flashcard_set.freezed.dart';
part 'flashcard_set.g.dart';

@freezed
class FlashcardSet with _$FlashcardSet {
  @JsonSerializable(explicitToJson: true)
  const factory FlashcardSet({
    required FlashCard flashCard,
    required String ownerId,
  }) = _FlashcardSet;

  factory FlashcardSet.fromJson(Map<String, dynamic> json) =>
      _$FlashcardSetFromJson(json);
}
