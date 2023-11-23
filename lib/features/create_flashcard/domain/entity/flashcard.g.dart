// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashCardImpl _$$FlashCardImplFromJson(Map<String, dynamic> json) =>
    _$FlashCardImpl(
      id: json['id'] as String,
      languageSet: json['languageSet'] as String,
      nameSet: json['nameSet'] as String,
      timeStamp: json['timeStamp'] as int,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FlashCardImplToJson(_$FlashCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageSet': instance.languageSet,
      'nameSet': instance.nameSet,
      'timeStamp': instance.timeStamp,
      'words': instance.words.map((e) => e.toJson()).toList(),
    };
