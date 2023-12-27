import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:primus/widgets/flip_card/flip_flashcard.dart';

import '../../features/create_flashcard/domain/entity/word.dart';

class SwiperTinder extends StatefulWidget {
  const SwiperTinder({required this.words, required this.language, super.key});

  final List<Word> words;
  final String language;
  @override
  State<SwiperTinder> createState() => _SwiperTinderState();
}

class _SwiperTinderState extends State<SwiperTinder> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: true,
      containerWidth: double.infinity,
      itemCount: widget.words.length,
      itemWidth: MediaQuery.of(context).size.width,
      itemBuilder: (context, index) {
        return FLipFlashcard(
            word: widget.words[index].word,
            wordDefinition: widget.words[index].definition,
            language: widget.language);
      },
    );
  }
}
