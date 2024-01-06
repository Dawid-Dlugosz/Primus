import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/learn_method/presentation/cubit/single_choice_test/single_choice_test_cubit.dart';

import '../../features/learn_method/domain/entities/test_word.dart';

class TestItem extends StatelessWidget {
  const TestItem({
    required this.definition,
    required this.testWord,
    required this.index,
    super.key,
  });
  final String definition;
  final TestWord testWord;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<SingleChoiceTestCubit>().setAnswer(
            index: index,
            answer: definition,
          ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: testWord.word.definition == testWord.answer &&
                  definition == testWord.answer
              ? Colors.green
              : definition != testWord.answer
                  ? null
                  : Colors.red,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(definition),
        ),
      ),
    );
  }
}
