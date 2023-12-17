import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/author_name/domain/repository/author_name_repository.dart';
import 'package:primus/features/author_name/presentation/author_name/author_name_cubit.dart';

class MockAuthorNameRepository extends Mock implements AuthorNameRepository {}

void main() {
  late MockAuthorNameRepository repository;
  late AuthorNameCubit cubit;

  setUp(
    () {
      repository = MockAuthorNameRepository();
      cubit = AuthorNameCubit(repository: repository);
    },
  );
  const tUid = 'uid';
  const tNickname = 'nickname';
  group(
    'AuthorNameCubit',
    () {
      test(
        'should emit empty string as a first state',
        () {
          expect(cubit.state, '');
        },
      );

      group(
        'getAuthorName',
        () {
          blocTest(
            'should emit empty string if repo return left',
            build: () => cubit,
            act: (_) {
              when(() => repository.getAuthorName(uid: any(named: 'uid')))
                  .thenAnswer((_) async => const Left(Failure.user()));

              cubit.getAuthorName(uid: tUid);
            },
            expect: () => (['']),
          );

          blocTest(
            'should emit string if repo return true',
            build: () => cubit,
            act: (_) {
              when(() => repository.getAuthorName(uid: any(named: 'uid')))
                  .thenAnswer((_) async => const Right(tNickname));

              cubit.getAuthorName(uid: tUid);
            },
            expect: () => ([tNickname]),
          );
        },
      );
    },
  );
}
