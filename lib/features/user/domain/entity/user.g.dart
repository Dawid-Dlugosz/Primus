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
      toLearn: (json['toLearn'] as List<dynamic>)
          .map((e) => ToLearn.fromJson(e as Map<String, dynamic>))
          .toList(),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'ownFlashcard': instance.ownFlashcard,
      'toLearn': instance.toLearn.map((e) => e.toJson()).toList(),
      'uid': instance.uid,
    };
