import 'package:bloc/bloc.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/domain/repository/user_repository.dart';

import '../../../domain/entity/user.dart';

class UserCubit extends Cubit<User?> {
  UserCubit({
    required this.repository,
  }) : super(null);

  final UserRepository repository;

  void getuser({required String uid, required String nickname}) async {
    final failureOrUser = await repository.getUser(uid: uid);
    failureOrUser.fold(
      (failure) => {},
      (user) => emit(user),
    );
  }

  void createUser({
    required String nickname,
    required String uid,
  }) async {
    final result = await repository.createUser(
      nickname: nickname,
      uid: uid,
    );

    result.fold(
      (l) => emit(null),
      (user) => emit(user),
    );
  }

  void addFlashcardSetToUser({
    required String flashcardSetId,
  }) async {
    if (state != null) {
      final result = await repository.addFlashcardSetToUser(
        flashcardSetId: flashcardSetId,
        user: state!,
      );

      result.fold(
        (l) => emit(state),
        (user) => emit(user),
      );
    } else {
      emit(state);
    }
  }

  void deleteToLearn({required String flashcardSetId}) async {
    final failureOrUser = await repository.deleteToLearn(
      flashcardSetId: flashcardSetId,
      user: state!,
    );

    failureOrUser.fold(
      (failure) => emit(state),
      (user) => emit(user),
    );
  }

  void deleteFlashcardSet({required String flashcardSetId}) async {
    if (state != null) {
      final result = await repository.deleteFlashcardSet(
        flashcardSetId: flashcardSetId,
        user: state!,
      );
      result.fold(
        (l) => emit(state),
        (user) => emit(user),
      );
    }
    emit(state);
  }

  void copyFlashcard({required FlashcardSet flashcardSet}) async {
    if (state != null) {
      final result = await repository.copyFlashcradSet(
        flashcardSet: flashcardSet,
        user: state!,
      );

      result.fold(
        (l) => emit(state),
        (user) {
          emit(user);
        },
      );
    }
    emit(state);
  }

  bool containtFlashcardSet({required String flashcardSetId}) {
    if (state == null) {
      return false;
    }
    if (state!.ownFlashcard.contains('flashcardSet/$flashcardSetId')) {
      return true;
    }

    if (state!.toLearn.isEmpty) {
      return false;
    }

    for (var element in state!.toLearn) {
      if (element.flashcardId == flashcardSetId) {
        return true;
      }
    }
    return false;
  }

  bool hasCopyFlashcard({required String flashcardSetId}) {
    if (state == null) {
      return false;
    }

    if (state!.toLearn.isEmpty) {
      return false;
    }

    for (var element in state!.toLearn) {
      if (element.flashcardId == flashcardSetId) {
        return true;
      }
    }
    return false;
  }

  void updateToLearn({required ToLearn toLearn}) async {
    final failureOrUser = await repository.updateToLearn(
      uid: state!.uid,
      toLearn: toLearn,
      user: state!,
    );

    failureOrUser.fold(
      (failure) => emit(state),
      (user) => emit(user),
    );
  }
}
