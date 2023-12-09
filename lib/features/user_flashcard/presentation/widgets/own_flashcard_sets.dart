import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import 'package:primus/widgets/empty_widget.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import 'flashcard_set_list/flashcard_set_list.dart';

class OwnFlashcardSets extends StatelessWidget {
  const OwnFlashcardSets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlashcardCubit, UserFlashcardState>(
      builder: (_, state) {
        return state.maybeMap(
            loaded: (value) => FlashcardSetList(
                  flashcardSets: value.flashcardSets,
                ),
            error: (value) => const CustomErrorWidget(),
            orElse: () => const EmptyWidget());
      },
    );
  }
}
