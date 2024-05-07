import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/cud_flashcard_cubit.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

class DeleteFlashcard extends StatelessWidget {
  const DeleteFlashcard({required this.flashcardId, super.key});
  final String flashcardId;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.flashcardDelete),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.no)),
              ElevatedButton(
                  onPressed: () {
                    context.read<CUDFlashcardCubit>().deleteFlashcardSet(
                          flashcardId: flashcardId,
                        );
                    context.read<UserCubit>().deleteFlashcardSet(
                          flashcardSetId: flashcardId,
                        );
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.yes)),
            ],
          )
        ],
      ),
    );
  }
}
