import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:primus/model/word.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class SwiperTinder extends StatefulWidget {
  const SwiperTinder({required this.words, required this.language, Key? key}) : super(key: key);

  final List<Word> words;
  final String language;
  @override
  State<SwiperTinder> createState() => _SwiperTinderState();
}

class _SwiperTinderState extends State<SwiperTinder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Align(
        alignment: Alignment.topCenter,
        child: Swiper(
          loop: true,
          outer: true,
          containerWidth: double.infinity,
          layout: SwiperLayout.TINDER,
          itemCount: widget.words.length,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 200,
          itemBuilder: (context, index) {
            return FLipFlashcard(word: widget.words[index].word, wordDefinition: widget.words[index].definition, language: widget.language);
          },
        ),
      ),
    );
  }
}
