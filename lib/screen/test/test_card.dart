import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/learn_method/presentation/cubit/single_choice_test/single_choice_test_cubit.dart';

import '../../features/learn_method/domain/entities/test_word.dart';
import 'test_item.dart';

class TestCard extends StatefulWidget {
  const TestCard({
    required this.testWords,
    super.key,
  });

  final List<TestWord> testWords;

  @override
  State<TestCard> createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  int wordIndex = 0;

  void decrement() {
    setState(() {
      wordIndex = wordIndex - 1;
    });
  }

  void increment() {
    setState(() {
      wordIndex = wordIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingleChoiceTestCubit, SingleChoiceTestState>(
      listener: (context, state) {
        state.mapOrNull(initial: (value) {
          setState(() {
            wordIndex = 0;
          });
        });
      },
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wordIndex != 0
                        ? IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: decrement,
                          )
                        : Container(),
                    Text('Słowo: ${widget.testWords[wordIndex].word.word}'),
                    wordIndex != widget.testWords.length - 1
                        ? Transform.rotate(
                            angle: pi,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: increment,
                            ),
                          )
                        : Container()
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    children: [
                      TestItem(
                        definition: widget.testWords[wordIndex].answerA,
                        index: wordIndex,
                        testWord: widget.testWords[wordIndex],
                      ),
                      TestItem(
                        definition: widget.testWords[wordIndex].answerB,
                        index: wordIndex,
                        testWord: widget.testWords[wordIndex],
                      ),
                      TestItem(
                        definition: widget.testWords[wordIndex].answerC,
                        index: wordIndex,
                        testWord: widget.testWords[wordIndex],
                      ),
                      TestItem(
                        definition: widget.testWords[wordIndex].answerD,
                        index: wordIndex,
                        testWord: widget.testWords[wordIndex],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
