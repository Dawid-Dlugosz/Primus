import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import 'package:primus/widgets/empty_widget.dart';

import '../../../widgets/card_flashcard.dart';

class AllFlashcard extends StatelessWidget {
  const AllFlashcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allSets),
      ),
      body: BlocBuilder<UserFlashcardCubit, UserFlashcardState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const EmptyWidget(),
            loaded: (value) {
              final flashcardSets = value.flashcardSets;
              if (flashcardSets.isEmpty) {
                return const EmptyWidget();
              }

              return ListView.builder(
                itemCount: flashcardSets.length,
                itemBuilder: (context, index) {
                  return CardFlashcard(
                    flashcard: flashcardSets[index].flashCard,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
