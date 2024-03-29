import 'to_learn.dart';

// TODO I THINK TO DELETE
class User {
  const User({
    required this.nickname,
    required this.uid,
    required this.ownFlashcard,
    required this.toLearn,
  });

  final String nickname;
  final String uid;
  // Path to flashcard
  final List<String>? ownFlashcard;
  final List<ToLearn>? toLearn;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'],
      uid: json['uid'],
      ownFlashcard: json['ownFlashcard'] == null
          ? null
          : json['ownFlashcard'].cast<String>()!,
      toLearn: json['toLearn'] == null
          ? null
          : (json['toLearn'] as List<dynamic>)
              .map((e) => ToLearn.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['nickname'] = nickname;
    json['uid'] = uid;
    json['ownFlashcard'] = ownFlashcard?.toList();
    json['toLearn'] = toLearn?.map((e) => e.toJson()).toList();
    return json;
  }

  User copyWith(
          {String? nickname,
          String? uid,
          List<String>? ownFlashcard,
          List<ToLearn>? toLearn}) =>
      User(
        nickname: nickname ?? this.nickname,
        uid: uid ?? this.uid,
        ownFlashcard: ownFlashcard ?? this.ownFlashcard,
        toLearn: toLearn ?? this.toLearn,
      );
}
