import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

class CopyFlashcard extends StatelessWidget {
  const CopyFlashcard({required this.flashcardSet, super.key});

  final FlashcardSet flashcardSet;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.copyFlashcard,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(AppLocalizations.of(context)!.no),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<UserCubit>()
                          .copyFlashcard(flashcardSet: flashcardSet);
                      Navigator.pop(context, true);
                    },
                    child: Text(AppLocalizations.of(context)!.yes),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
