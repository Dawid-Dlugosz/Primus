import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/entity/to_learn.dart';
import '../../../../user/domain/entity/to_learn_word.dart';
import '../../../../user/presentation/cubit/cubit/user_cubit.dart';
import '../../../domain/entities/test_word.dart';

part 'single_choice_test_state.dart';
part 'single_choice_test_cubit.freezed.dart';

class SingleChoiceTestCubit extends Cubit<SingleChoiceTestState> {
  SingleChoiceTestCubit({
    required this.flashcardSetId,
    required this.user,
  }) : super(const SingleChoiceTestState.initial());

  final String flashcardSetId;
  final UserCubit user;

  void initial({ToLearn? toLearnVariable}) {
    emit(const SingleChoiceTestState.initial());

    final toLearn = toLearnVariable ??
        user.state!.toLearn
            .firstWhere((element) => element.flashcardId == flashcardSetId);

    final List<ToLearnWord> know = [];
    final List<ToLearnWord> unknow = [];

    for (var element in toLearn.words) {
      if (element.learnMethod.test) {
        know.add(element);
      } else {
        unknow.add(element);
      }
    }
    final allToLearn = [...know, ...unknow];
    allToLearn.shuffle;

    final testWords = <TestWord>[];
    for (var element in unknow) {
      testWords.add(createTestWord(element, toLearn));
    }

    emit(SingleChoiceTestState.loaded(
      know: know,
      unknow: unknow,
      toLearn: toLearn,
      testWords: testWords,
      showAgain: false,
    ));
  }

  TestWord createTestWord(
    ToLearnWord toLearnWord,
    ToLearn toLearn,
  ) {
    final answers = <ToLearnWord>[];
    final rng = Random();

    final tmpWord = toLearn.words
        .where((element) => element.word.id != toLearnWord.word.id);

    Set<int> randomNumbers = {};

    while (randomNumbers.length < 3) {
      final randomNumber = rng.nextInt(tmpWord.length);
      randomNumbers.add(randomNumber);
    }

    for (var i = 0; i < 3; i++) {
      answers.add(tmpWord.elementAt(randomNumbers.elementAt(i)));
    }

    answers.add(toLearnWord);
    answers.shuffle();

    final answer = TestWord(
      answerA: answers[0].word.definition,
      answerB: answers[1].word.definition,
      answerC: answers[2].word.definition,
      answerD: answers[3].word.definition,
      word: toLearnWord.word,
    );

    return answer;
  }

  void setAnswer({required int index, required String answer}) {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        if (value.testWords[index].answer == null) {
          final newTestWords = [...value.testWords];
          final newTestWord = newTestWords[index].copyWith(answer: answer);
          newTestWords[index] = newTestWord;
          if (newTestWord.word.definition == answer) {
            _markAsKnow(value.toLearn, value.testWords[index].word.id);
          }

          emit(
            value.copyWith(
                testWords: newTestWords,
                showAgain: index == value.testWords.length - 1),
          );
        }
      },
    );
  }

  void _markAsKnow(
    ToLearn toLearn,
    String wordId,
  ) {
    final index =
        toLearn.words.indexWhere((element) => element.word.id == wordId);

    final learnMethod = toLearn.words[index].learnMethod.copyWith(test: true);
    final newWords = [...toLearn.words];
    newWords[index] = newWords[index].copyWith(learnMethod: learnMethod);

    final newToLearn = toLearn.copyWith(words: newWords);

    user.updateToLearn(toLearn: newToLearn);
  }

  void clearProgres() {
    state.maybeMap(
      orElse: () => emit(state),
      loaded: (value) {
        final newWords = [...value.toLearn.words];
        for (var i = 0; i < newWords.length; i++) {
          final learnMethodCopy = newWords[i].learnMethod.copyWith(test: false);
          newWords[i] = newWords[i].copyWith(learnMethod: learnMethodCopy);
        }

        final newToLearn = value.toLearn.copyWith(words: newWords);
        user.updateToLearn(toLearn: newToLearn);
        initial(toLearnVariable: newToLearn);
      },
    );
  }
}
