import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/learn_method/presentation/cubit/flashcard/flashcard_learn_cubit.dart';

import '../../widgets/flascard_learn/empty_words.dart';
import '../../widgets/flascard_learn/swiper_flascard.dart';
import '../../widgets/again_learn_flashcard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashcardLearn extends StatefulWidget {
  const FlashcardLearn({super.key});

  @override
  State<FlashcardLearn> createState() => _FlashcardLearnState();
}

class _FlashcardLearnState extends State<FlashcardLearn> {
  bool block = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.learnModeFlashcard,
            ),
          ],
        ),
      ),
      body: BlocBuilder<FlashcardLearnCubit, FlashcardLearnState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const LoadingWidget(),
            loaded: (value) {
              if (value.learnAgain) {
                return AgainLearnFlashcard(
                  again: () => {},
                  // again: () => viewModel.learnOneMoreTime(),
                );
              }
              if (value.unknow.isEmpty) {
                return EmptyWords(
                  clearProgress: () => {},
                  // clearProgress: viewModel.clearPorgress,
                );
              }
              return SwiperFlashcard(
                words: value.unknow,
                language: value.language,
              );
            },
          );
        },
      ),
    );
  }
}
