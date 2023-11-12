import 'dart:math';

import 'package:flutter/material.dart';
import 'front_card.dart';
import 'reverse_card.dart';

class FLipFlashcard extends StatefulWidget {
  FLipFlashcard(
      {required this.word,
      required this.wordDefinition,
      required this.language,
      Key? key})
      : super(key: key);

  final String word;
  final String wordDefinition;
  final String language;
  bool isReverse = false;

  @override
  State<FLipFlashcard> createState() => _FLipFlashcardState();
}

class _FLipFlashcardState extends State<FLipFlashcard> {
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: angle),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double value, _) {
        if (value >= (pi / 2)) {
          widget.isReverse = true;
        } else {
          widget.isReverse = false;
        }

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    spreadRadius: -7,
                    blurRadius: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  )
                ]),
            child: widget.isReverse
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
          ),
        );
      },
    );
  }
}
