import 'package:bloc/bloc.dart';
import 'package:primus/features/user/domain/repository/user_repository.dart';

import '../../../domain/entity/user.dart';

class UserCubit extends Cubit<User?> {
  UserCubit({
    required this.repository,
  }) : super(null);

  final UserRepository repository;

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
}
