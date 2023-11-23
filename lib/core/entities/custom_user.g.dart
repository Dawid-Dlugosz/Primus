// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomUserImpl _$$CustomUserImplFromJson(Map<String, dynamic> json) =>
    _$CustomUserImpl(
      nickName: json['nickName'] as String,
      uid: json['uid'] as String,
      ownFlashcard: (json['ownFlashcard'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      toLearn: (json['toLearn'] as List<dynamic>?)
          ?.map((e) => ToLearn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomUserImplToJson(_$CustomUserImpl instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'uid': instance.uid,
      'ownFlashcard': instance.ownFlashcard,
      'toLearn': instance.toLearn,
    };
