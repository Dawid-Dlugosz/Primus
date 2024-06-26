import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primus/features/user/domain/entity/to_learn_word.dart';
import 'package:primus/features/user/domain/entity/user.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';
import 'package:primus/features/vocabulary/domain/entity/vocabulary.dart';
import 'package:primus/features/vocabulary/domain/repository/vocabulary_repository.dart';

import '../../../create_flashcard/domain/entity/word.dart';

part 'vocabulary_state.dart';
part 'vocabulary_cubit.freezed.dart';

class VocabularyCubit extends Cubit<VocabularyState> {
  VocabularyCubit({required this.repository})
      : super(const VocabularyState.initial());

  final VocabularyRepository repository;

  void getVocabulary({
    required UserCubit user,
    required String flashcardSetId,
  }) async {
    final result = await repository.getWords(flashcardSetId: flashcardSetId);

    result.fold(
      (l) => emit(const VocabularyState.error()),
      (words) {
        try {
          _initSplitWords(user.state!, flashcardSetId, words);
          // user.stream.listen((event) {
          //   _initSplitWords(event!, flashcardSetId, words);
          // });
        } catch (_) {
          emit(
            VocabularyState.loaded(
              vocabulary: Vocabulary(
                know: [],
                unknow: words,
              ),
            ),
          );
        }
      },
    );
  }

  void _initSplitWords(User user, String flashcardSetId, List<Word> words) {
    final toLearn = user.toLearn.firstWhere(
      (element) => element.flashcardId == flashcardSetId,
    );
    emit(
      VocabularyState.loaded(
        vocabulary: splitWords(
          toLearn.words,
          words,
        ),
      ),
    );
  }

  Vocabulary splitWords(
    List<ToLearnWord> toLearnWords,
    List<Word> words,
  ) {
    final knowWrods = <Word>[];
    final unknowWrods = <Word>[];

    for (var toLearnWord in toLearnWords) {
      final word =
          words.firstWhere((element) => element.id == toLearnWord.word.id);
      if (toLearnWord.isKnowedWord()) {
        knowWrods.add(word);
      } else {
        unknowWrods.add(word);
      }
    }
    return Vocabulary(
      know: knowWrods,
      unknow: unknowWrods,
    );
  }
}
