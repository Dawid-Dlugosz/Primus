import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/learn_method/presentation/cubit/flashcard/flashcard_learn_cubit.dart';

class AgainLearnFlashcard extends StatelessWidget {
  const AgainLearnFlashcard({required this.again, super.key});

  final VoidCallback again;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalizations.of(context)!.itsAllWords,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            '?',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () => context.read<FlashcardLearnCubit>().tryAgain(),
            child: Text(AppLocalizations.of(context)!.learnAgain),
          ),
        ],
      ),
    );
  }
}
