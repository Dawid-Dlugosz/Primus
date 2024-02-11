import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/learn_method/presentation/cubit/spelling/spelling_cubit.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';
import '../features/learn_method/domain/entities/spelling_word.dart';
import '../widgets/flascard_learn/empty_words.dart';

class FlashcardSpelling extends StatefulWidget {
  const FlashcardSpelling({super.key});

  @override
  State<FlashcardSpelling> createState() => _FlashcardSpellingState();
}

class _FlashcardSpellingState extends State<FlashcardSpelling> {
  int wordIndex = 0;

  final TextEditingController controller = TextEditingController();
  void increment(List<SpellingWord> spellings) {
    context.read<SpellingCubit>().addEnterredText(
          index: wordIndex,
          text: controller.text,
        );
    setState(() {
      wordIndex = wordIndex + 1;
      controller.text = spellings[wordIndex].enteredWord ?? '';
    });
  }

  void decrement(List<SpellingWord> spellings) {
    context.read<SpellingCubit>().addEnterredText(
          index: wordIndex,
          text: controller.text,
        );
    setState(() {
      wordIndex = wordIndex - 1;
      controller.text = spellings[wordIndex].enteredWord ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.spellingType),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: BlocBuilder<SpellingCubit, SpellingState>(
            builder: (context, state) {
              return state.maybeMap(
                  orElse: () => const LoadingWidget(),
                  loaded: (value) {
                    if (value.unknow.isEmpty) {
                      return EmptyWords(
                        clearProgress: () =>
                            context.read<SpellingCubit>().clearProgres(),
                      );
                    }
                    return Card(
                      color: value.unknow[wordIndex].correct
                          ? Colors.green
                          : Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                wordIndex != 0
                                    ? IconButton(
                                        icon: const Icon(Icons.arrow_back),
                                        onPressed: () {
                                          decrement(value.unknow);
                                        },
                                      )
                                    : Container(),
                                Text(
                                  value.unknow[wordIndex].word.word,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                wordIndex != value.unknow.length - 1
                                    ? Transform.rotate(
                                        angle: pi,
                                        child: IconButton(
                                          icon: const Icon(Icons.arrow_back),
                                          onPressed: () {
                                            increment(value.unknow);
                                          },
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            value.unknow[wordIndex].showHint
                                ? Text(
                                    'Odpowiedź: ${value.unknow[wordIndex].word.definition}')
                                : Container(),
                            value.unknow[wordIndex].correct
                                ? RichText(
                                    text: TextSpan(
                                      text: 'Definicja ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: value.unknow[wordIndex].word
                                              .definition,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                          label: const Text(
                                              'Podaj znaczenie słowa'),
                                          errorText: value.wrongDefinition
                                              ? 'Podaj poprawną definicje'
                                              : null,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          !value.unknow[wordIndex].showHint
                                              ? ElevatedButton(
                                                  onPressed: () => context
                                                      .read<SpellingCubit>()
                                                      .showHintInWord(
                                                          index: wordIndex),
                                                  child: const Text(
                                                    'Pokaż podpowiedź',
                                                  ),
                                                )
                                              : Container(),
                                          !value.unknow[wordIndex].showHint
                                              ? ElevatedButton(
                                                  onPressed: () {
                                                    context
                                                        .read<SpellingCubit>()
                                                        .checkCorrect(
                                                          text: controller.text,
                                                          index: wordIndex,
                                                          uid: context
                                                              .read<UserCubit>()
                                                              .state!
                                                              .uid,
                                                        );
                                                  },
                                                  child: const Text('Sprawdź'),
                                                )
                                              : value.unknow.length - 1 !=
                                                      wordIndex
                                                  ? ElevatedButton(
                                                      onPressed: () {
                                                        increment(value.unknow);
                                                      },
                                                      child:
                                                          const Text('Dalej'),
                                                    )
                                                  : Container()
                                        ],
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
