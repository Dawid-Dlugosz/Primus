import 'dart:math';

import 'package:flutter/material.dart';
import 'front_card.dart';
import 'reverse_card.dart';

class FLipFlashcard extends StatefulWidget {
  const FLipFlashcard({
    required this.word,
    required this.wordDefinition,
    required this.language,
    super.key,
  });

  final String word;
  final String wordDefinition;
  final String language;

  @override
  State<FLipFlashcard> createState() => _FLipFlashcardState();
}

class _FLipFlashcardState extends State<FLipFlashcard> {
  double angle = 0;
  bool isReverse = false;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double value, _) {
          if (value >= (pi / 2)) {
            isReverse = true;
          } else {
            isReverse = false;
          }

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(value),
            child: isReverse
                ? ReverseCard(
                    wordDefinition: widget.wordDefinition,
                    flip: _flip,
                    language: widget.language,
                  )
                : FrontCard(
                    word: widget.word,
                    flip: _flip,
                    language: widget.language,
                  ),
          );
        },
      ),
    );
  }
}
