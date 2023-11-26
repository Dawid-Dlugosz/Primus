import 'package:freezed_annotation/freezed_annotation.dart';

import 'to_learn.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String nickname,
    required List<String> ownFlashcard,
    required List<ToLearn> toLearn,
    required String uid,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
