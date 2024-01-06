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

  void markToLearnWord({
    required String wordId,
    required bool marker,
  }) {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newToLearnWords = [...value.toLearn.words];
        final index =
            newToLearnWords.indexWhere((element) => element.word.id == wordId);
        final toLearnCopy =
            newToLearnWords[index].learnMethod.copyWith(flashcard: marker);
        newToLearnWords[index] =
            newToLearnWords[index].copyWith(learnMethod: toLearnCopy);

        user.updateToLearn(
            toLearn: value.toLearn.copyWith(words: newToLearnWords));

        emit(
          FlashcardLearnState.loaded(
            learnAgain: value.learnAgain,
            language: language,
            know: value.know,
            unknow: value.unknow,
            toLearn: value.toLearn.copyWith(words: newToLearnWords),
          ),
        );
      },
    );
  }

  void clearProgress() {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newWords = [...value.toLearn.words];
        for (var i = 0; i < newWords.length; i++) {
          final learnMethodCopy =
              newWords[i].learnMethod.copyWith(flashcard: false);
          newWords[i] = newWords[i].copyWith(learnMethod: learnMethodCopy);
        }
        final newToLearn = value.toLearn.copyWith(words: newWords);
        user.updateToLearn(toLearn: newToLearn);
        initial(toLearnVariable: newToLearn);
      },
    );
  }
}
