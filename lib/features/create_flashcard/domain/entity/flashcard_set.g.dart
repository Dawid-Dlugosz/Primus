// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardSetImpl _$$FlashcardSetImplFromJson(Map<String, dynamic> json) =>
    _$FlashcardSetImpl(
      flashCard: FlashCard.fromJson(json['flashCard'] as Map<String, dynamic>),
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$$FlashcardSetImplToJson(_$FlashcardSetImpl instance) =>
    <String, dynamic>{
      'flashCard': instance.flashCard.toJson(),
      'ownerId': instance.ownerId,
    };
