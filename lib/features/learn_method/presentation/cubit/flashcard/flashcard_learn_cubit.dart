import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

import '../../../../user/domain/entity/to_learn_word.dart';

part 'flashcard_learn_state.dart';
part 'flashcard_learn_cubit.freezed.dart';

class FlashcardLearnCubit extends Cubit<FlashcardLearnState> {
  FlashcardLearnCubit({
    required this.user,
    required this.language,
    required this.flashcardSetId,
  }) : super(const FlashcardLearnState.initial());

  final UserCubit user;
  final String language;
  final String flashcardSetId;

  void initial({ToLearn? toLearnVariable}) async {
    emit(const FlashcardLearnState.initial());
    final toLearn = toLearnVariable ??
        user.state!.toLearn
            .firstWhere((element) => element.flashcardId == flashcardSetId);

    final List<ToLearnWord> know = [];
    final List<ToLearnWord> unknow = [];

    for (var element in toLearn.words) {
      if (element.learnMethod.flashcard) {
        know.add(element);
      } else {
        unknow.add(element);
      }
    }

    emit(
      FlashcardLearnState.loaded(
        learnAgain: false,
        language: language,
        know: know,
        unknow: unknow,
        toLearn: toLearn,
      ),
    );
  }

  void askAgain() {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) => emit(
        FlashcardLearnState.loaded(
          learnAgain: true,
          language: language,
          know: value.know,
          unknow: value.unknow,
          toLearn: value.toLearn,
        ),
      ),
    );
  }

  void tryAgain() {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) => initial(toLearnVariable: value.toLearn),
    );
  }

  void markToLearnWord({required wordId, required bool value}) {}
}
