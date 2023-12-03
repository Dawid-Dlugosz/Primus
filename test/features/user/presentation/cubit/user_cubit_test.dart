import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/user/data/repository/user_repository_impl.dart';
import 'package:primus/features/user/domain/entity/user.dart';
import 'package:primus/features/user/domain/repository/user_repository.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late UserCubit cubit;

  setUp(() {
    repository = MockUserRepository();
    cubit = UserCubit(repository: repository);
  });
  const tNickname = 'nickaname';
  const tUid = "uid";
  const tFlashcardId = 'flashcardId';
  const tUser = User(
    nickname: tNickname,
    ownFlashcard: [],
    toLearn: [],
    uid: tUid,
  );
  final tUserWithFlashcard = tUser.copyWith(ownFlashcard: [tFlashcardId]);

  group(
    'UserCubitTest',
    () {
      test(
        'should emit [Null] as first state',
        () {
          expect(cubit.state, null);
        },
      );

      blocTest(
        'should emit [null] if repo return left',
        build: () => cubit,
        act: (_) {
          when(
            () => repository.createUser(
              nickname: any(named: "nickname"),
              uid: any(named: "uid"),
            ),
          ).thenAnswer((_) async => const Left(Failure.user()));
          cubit.createUser(
            nickname: tNickname,
            uid: tUid,
          );
        },
        expect: () => [null],
      );

      blocTest(
        'should emit [User] if repo return user',
        build: () => cubit,
        act: (_) {
          when(
            () => repository.createUser(
              nickname: any(named: "nickname"),
              uid: any(named: "uid"),
            ),
          ).thenAnswer((_) async => const Right(tUser));
          cubit.createUser(
            nickname: tNickname,
            uid: tUid,
          );
        },
        expect: () => [tUser],
      );

      blocTest(
        'should emit [User] with new flashcardid when repo return right',
        build: () => cubit,
        act: (_) {
          when(
            () => repository.addFlashcardSetToUser(
              flashcardSetId: any(named: 'flashcardSetId'),
              user: tUser,
            ),
          ).thenAnswer(
            (_) async => Right(tUserWithFlashcard),
          );

          cubit.addFlashcardSetToUser(
            flashcardSetId: tFlashcardId,
            user: tUser,
          );
        },
        expect: () => [tUserWithFlashcard],
      );

      blocTest(
        'should emit [null] when repo return left',
        build: () => cubit,
        act: (_) {
          when(
            () => repository.addFlashcardSetToUser(
              flashcardSetId: any(named: 'flashcardSetId'),
              user: tUser,
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.user()),
          );

          cubit.addFlashcardSetToUser(
            flashcardSetId: tFlashcardId,
            user: tUser,
          );
        },
        expect: () => [null],
      );

      blocTest(
        'should emit [User] without new flashcard when repo return left',
        build: () => cubit,
        setUp: () => tUserWithFlashcard,
        act: (_) {
          when(
            () => repository.addFlashcardSetToUser(
              flashcardSetId: any(named: 'flashcardSetId'),
              user: tUserWithFlashcard,
            ),
          ).thenAnswer((_) async => const Left(Failure.user()));

          cubit.addFlashcardSetToUser(
              flashcardSetId: tFlashcardId, user: tUserWithFlashcard);
        },
        expect: () => [tUserWithFlashcard],
      );
    },
  );
}
