// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      nickname: json['nickname'] as String,
      ownFlashcard: (json['ownFlashcard'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      toLearn: ToLearn.fromJson(json['toLearn'] as Map<String, dynamic>),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'ownFlashcard': instance.ownFlashcard,
      'toLearn': instance.toLearn.toJson(),
      'uid': instance.uid,
    };
