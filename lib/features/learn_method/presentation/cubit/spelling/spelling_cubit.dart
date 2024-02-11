import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

import '../../../domain/entities/spelling_word.dart';

part 'spelling_state.dart';
part 'spelling_cubit.freezed.dart';

class SpellingCubit extends Cubit<SpellingState> {
  SpellingCubit({required this.flashcardSetId, required this.user})
      : super(const SpellingState.initial());

  final String flashcardSetId;
  final UserCubit user;

  void initial({ToLearn? toLearnVariable}) {
    emit(const SpellingState.initial());
    final ToLearn toLearn = toLearnVariable ??
        user.state!.toLearn
            .firstWhere((element) => element.flashcardId == flashcardSetId);
    final List<SpellingWord> know = [];
    final List<SpellingWord> unknow = [];

    for (var element in toLearn.words) {
      final spellingWord = SpellingWord(
        word: element.word,
        showHint: false,
        correct: false,
      );
      if (element.learnMethod.spelling) {
        know.add(spellingWord);
      } else {
        unknow.add(spellingWord);
      }
    }

    emit(SpellingState.loaded(
      know: know,
      unknow: unknow,
      wrongDefinition: false,
      toLearn: toLearn,
    ));
  }

  void showHintInWord({required int index}) {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newList = [...value.unknow];
        final newSpellingWord = value.unknow[index].copyWith(showHint: true);
        newList[index] = newSpellingWord;
        emit(
          SpellingState.loaded(
            know: value.know,
            unknow: newList,
            wrongDefinition: false,
            toLearn: value.toLearn,
          ),
        );
      },
    );
  }

  void addEnterredText({required String text, required int index}) {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newList = [...value.unknow];
        final newSpellingWord = value.unknow[index].copyWith(enteredWord: text);
        newList[index] = newSpellingWord;
        emit(
          SpellingState.loaded(
            know: value.know,
            unknow: newList,
            wrongDefinition: false,
            toLearn: value.toLearn,
          ),
        );
      },
    );
  }

  void checkCorrect({
    required String text,
    required int index,
    required String uid,
  }) {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final spellingWord = value.unknow[index];
        if (_levenshtein(spellingWord.word.definition, text) < 3) {
          final newList = [...value.unknow];
          final newSpellingWord =
              value.unknow[index].copyWith(enteredWord: text, correct: true);
          newList[index] = newSpellingWord;
          final indexOf = value.toLearn.words.indexWhere(
            (element) => element.word.id == spellingWord.word.id,
          );
          final learnMethod = value.toLearn.words[indexOf].learnMethod;
          final newWords = [...value.toLearn.words];
          newWords[indexOf] = newWords[index]
              .copyWith(learnMethod: learnMethod.copyWith(spelling: true));

          final newToLearn = value.toLearn.copyWith(words: newWords);
          user.updateToLearn(toLearn: newToLearn);
          emit(
            SpellingState.loaded(
              know: value.know,
              unknow: newList,
              wrongDefinition: false,
              toLearn: newToLearn,
            ),
          );
        } else {
          emit(
            SpellingState.loaded(
              know: value.know,
              unknow: value.unknow,
              wrongDefinition: true,
              toLearn: value.toLearn,
            ),
          );
        }
      },
    );
  }

  void clearProgres() {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newWords = [...value.toLearn.words];
        for (var i = 0; i < newWords.length; i++) {
          final learnMethodCopy =
              newWords[i].learnMethod.copyWith(spelling: false);
          newWords[i] = newWords[i].copyWith(learnMethod: learnMethodCopy);
        }
        final newToLearn = value.toLearn.copyWith(words: newWords);
        user.updateToLearn(toLearn: newToLearn);

        initial(toLearnVariable: newToLearn);
      },
    );
  }

  int _levenshtein(String word, String definition) {
    if (word == definition) return 0;
    if (word.isEmpty) return definition.length;
    if (definition.isEmpty) return word.length;

    List<int> workVector1 = List<int>.filled(definition.length + 1, 0);
    List<int> workVector2 = workVector1;

    for (int i = 0; i < definition.length + 1; i < i++) {
      workVector1[i] = i;
    }

    for (int i = 0; i < word.length; i++) {
      workVector2[0] = i + 1;

      for (int j = 0; j < definition.length; j++) {
        int cost = (word[i] == definition[j]) ? 0 : 1;
        workVector2[j + 1] = min(workVector2[j] + 1,
            min(workVector1[j + 1] + 1, workVector1[j] + cost));
      }

      for (int j = 0; j < definition.length + 1; j++) {
        workVector1[j] = workVector2[j];
      }
    }

    return workVector2[definition.length];
  }
}
