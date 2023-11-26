import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn_method.freezed.dart';
part 'learn_method.g.dart';

@freezed
class LearnMethod with _$LearnMethod {
  const factory LearnMethod({
    required bool flashcard,
    required bool spelling,
    required bool test,
  }) = _LearnMethod;

  factory LearnMethod.fromJson(Map<String, dynamic> json) =>
      _$LearnMethodFromJson(json);
}
