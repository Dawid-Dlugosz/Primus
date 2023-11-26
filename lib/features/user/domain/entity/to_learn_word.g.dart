// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_learn_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToLearnWordImpl _$$ToLearnWordImplFromJson(Map<String, dynamic> json) =>
    _$ToLearnWordImpl(
      learnMethod:
          LearnMethod.fromJson(json['learnMethod'] as Map<String, dynamic>),
      word: Word.fromJson(json['word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ToLearnWordImplToJson(_$ToLearnWordImpl instance) =>
    <String, dynamic>{
      'learnMethod': instance.learnMethod.toJson(),
      'word': instance.word.toJson(),
    };
