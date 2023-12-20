import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../create_flashcard/domain/entity/word.dart';

part 'vocabulary.freezed.dart';

@freezed
class Vocabulary with _$Vocabulary {
  factory Vocabulary({
    required List<Word> know,
    required List<Word> unknow,
  }) = _Vocabulary;
}
