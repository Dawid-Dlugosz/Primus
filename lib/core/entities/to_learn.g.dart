// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_learn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToLearnImpl _$$ToLearnImplFromJson(Map<String, dynamic> json) =>
    _$ToLearnImpl(
      flashcardId: json['flashcardId'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => ToLearnWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeStamp: json['timeStamp'] as int,
    );

Map<String, dynamic> _$$ToLearnImplToJson(_$ToLearnImpl instance) =>
    <String, dynamic>{
      'flashcardId': instance.flashcardId,
      'words': instance.words,
      'timeStamp': instance.timeStamp,
    };
