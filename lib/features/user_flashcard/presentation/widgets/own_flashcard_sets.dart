import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import 'package:primus/features/user_flashcard/presentation/widgets/flashcard_list/flashcard_list.dart';
import 'package:primus/widgets/empty_widget.dart';

class OwnFlashcardSets extends StatelessWidget {
  const OwnFlashcardSets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlashcardCubit, UserFlashcardState>(
      builder: (_, state) {
        return state.maybeMap(
            loaded: (value) => FlashcardList(flashcards: flashcards),
            // TODO MAKE ERROR WIDGET
            error: (value) => Container(),
            orElse: () => const EmptyWidget());
      },
    );
  }
}
