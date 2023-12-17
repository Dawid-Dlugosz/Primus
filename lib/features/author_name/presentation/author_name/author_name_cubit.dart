import 'package:bloc/bloc.dart';

import '../../domain/repository/author_name_repository.dart';

class AuthorNameCubit extends Cubit<String> {
  AuthorNameCubit({required this.repository}) : super('');

  final AuthorNameRepository repository;

  Future<void> getAuthorName({required String uid}) async {
    final result = await repository.getAuthorName(uid: uid);

    result.fold(
      (l) => emit(''),
      (r) => emit(r),
    );
  }
}
