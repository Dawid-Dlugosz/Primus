import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/learn_method/presentation/cubit/single_choice_test/single_choice_test_cubit.dart';
import 'test_card.dart';
import '../../widgets/flascard_learn/empty_words.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashcardExam extends StatefulWidget {
  const FlashcardExam({super.key});

  @override
  State<FlashcardExam> createState() => _FlashcardExamState();
}

class _FlashcardExamState extends State<FlashcardExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.learnMethodTest),
          ],
        ),
      ),
      body: BlocBuilder<SingleChoiceTestCubit, SingleChoiceTestState>(
        builder: (context, state) {
          return state.maybeMap(
              orElse: () => const LoadingWidget(),
              loaded: (value) {
                if (value.unknow.isNotEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TestCard(testWords: value.testWords),
                      value.showAgain
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<SingleChoiceTestCubit>()
                                      .initial();
                                },
                                child: Text('Do Again'),
                              ),
                            )
                          : Container(),
                    ],
                  );
                }
                return EmptyWords(
                  clearProgress: () =>
                      context.read<SingleChoiceTestCubit>().clearProgres(),
                );
              });
          // return viewModel.testWords.isNotEmpty;
        },
      ),
    );
  }
}
