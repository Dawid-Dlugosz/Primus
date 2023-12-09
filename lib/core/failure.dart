import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.tooShort() = _ToShort;
  const factory Failure.flashcardNameBuse() = _FlashcardNameBusy;
  const factory Failure.user() = _User;
  const factory Failure.general() = _General;
  const factory Failure.flashcard() = _Flashcard;
}
