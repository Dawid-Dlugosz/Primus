import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/model/to_learn.dart';

part 'custom_user.g.dart';
part 'custom_user.freezed.dart';

@freezed
class CustomUser with _$CustomUser {
  const factory CustomUser({
    required String nickName,
    required String uid,
    required List<String>? ownFlashcard,
    required List<ToLearn>? toLearn,
  }) = _CustomUser;

  factory CustomUser.fromJson(Map<String, dynamic> json) =>
      _$CustomUserFromJson(json);
}
