import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_word.freezed.dart';

@freezed
class FlashWord with _$FlashWord {
  const factory FlashWord({
    required TextFormField wordField,
    required TextFormField definitionField,
  }) = _FlashWord;
}
