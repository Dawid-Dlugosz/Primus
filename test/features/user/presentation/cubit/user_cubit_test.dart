import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard.dart';
import 'package:primus/features/create_flashcard/domain/entity/flashcard_set.dart';
import 'package:primus/features/create_flashcard/domain/entity/word.dart';
import 'package:primus/features/user/domain/entity/learn_method.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';
import 'package:primus/features/user/domain/entity/to_learn_word.dart';
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
  final timeStamp = DateTime(2023, 1, 1).millisecondsSinceEpoch;
  final tFlashcardSet = FlashcardSet(
    flashCard: FlashCard(
      id: '1',
      languageSet: 'english',
      nameSet: 'nameSet',
      timeStamp: timeStamp,
      words: [
        const Word(
          id: 'id',
          word: 'word',
          definition: 'definition',
        ),
      ],
    ),
    ownerId: 'owner',
  );

  final toLearn = ToLearn(
    flashcardId: '1',
    words: [
      const ToLearnWord(
        learnMethod: LearnMethod(
          flashcard: false,
          spelling: false,
          test: false,
        ),
        word: Word(
          id: 'id',
          word: 'word',
          definition: 'definition',
        ),
      ),
    ],
    timeStamp: timeStamp,
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

      blocTest<UserCubit, User?>(
        'should emit [User] with new flashcardid when repo return right',
        build: () => cubit,
        seed: () => tUser,
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
          );
        },
        expect: () => [null],
      );

      blocTest<UserCubit, User?>(
        'should emit empty list without state bcz repo repo failre and bloc emit the same state',
        build: () => cubit,
        seed: () => tUserWithFlashcard,
        act: (_) async {
          when(
            () => repository.addFlashcardSetToUser(
              flashcardSetId: any(named: 'flashcardSetId'),
              user: tUserWithFlashcard,
            ),
          ).thenAnswer((_) async => const Left(Failure.user()));

          cubit.addFlashcardSetToUser(
            flashcardSetId: tFlashcardId,
          );
        },
        expect: () => [],
      );

      group(
        'deleteFlashcardSet',
        () {
          blocTest<UserCubit, User?>(
            'Should emit new [User] state when repo return user',
            build: () => cubit,
            seed: () => tUserWithFlashcard,
            act: (_) {
              when(() => repository.deleteFlashcardSet(
                  flashcardSetId: any(named: 'flashcardSetId'),
                  user: tUserWithFlashcard)).thenAnswer(
                (_) async => const Right(tUser),
              );

              cubit.deleteFlashcardSet(flashcardSetId: tFlashcardId);
            },
            expect: () => [tUser],
          );

          blocTest<UserCubit, User?>(
            'Should emit empty state when repo return failure',
            build: () => cubit,
            seed: () => tUserWithFlashcard,
            act: (_) {
              when(() => repository.deleteFlashcardSet(
                      flashcardSetId: any(named: 'flashcardSetId'),
                      user: tUserWithFlashcard))
                  .thenAnswer((_) async => const Left(Failure.user()));

              cubit.deleteFlashcardSet(flashcardSetId: tFlashcardId);
            },
            expect: () => [],
          );
        },
      );

      group(
        'copyFlashcardSet',
        () {
          blocTest(
            'should emit [null] if user state is empty',
            build: () => cubit,
            setUp: () {
              when(
                () => repository.copyFlashcradSet(
                  flashcardSet: tFlashcardSet,
                  user: cubit.state!,
                ),
              );
            },
            act: (_) {
              cubit.copyFlashcard(flashcardSet: tFlashcardSet);
            },
            expect: () => [null],
          );

          blocTest<UserCubit, User?>(
            'should not emit new state if repo return failure',
            build: () => cubit,
            seed: () => tUser,
            setUp: () {},
            act: (_) {
              when(
                () => repository.copyFlashcradSet(
                  flashcardSet: tFlashcardSet,
                  user: cubit.state!,
                ),
              ).thenAnswer((_) async => const Left(Failure.general()));

              cubit.copyFlashcard(flashcardSet: tFlashcardSet);
            },
            expect: () => [],
          );

          blocTest<UserCubit, User?>(
            'should emit [User] if repo return right',
            build: () => cubit,
            seed: () => tUser,
            setUp: () {},
            act: (_) {
              when(
                () => repository.copyFlashcradSet(
                  flashcardSet: tFlashcardSet,
                  user: cubit.state!,
                ),
              ).thenAnswer(
                (_) async => Right(
                  tUser.copyWith(
                    toLearn: [toLearn],
                  ),
                ),
              );

              cubit.copyFlashcard(flashcardSet: tFlashcardSet);
            },
            expect: () => [
              tUser.copyWith(toLearn: [toLearn])
            ],
          );
        },
      );

      group(
        'containtFlashcardSet',
        () {
          blocTest(
            'should return false if state is null',
            build: () => cubit,
            act: (_) {
              final result =
                  cubit.containtFlashcardSet(flashcardSetId: tFlashcardId);
              expect(result, false);
            },
          );

          blocTest<UserCubit, User?>(
            'should return true if user ownFlashcard contain the flashcardSetId',
            build: () => cubit,
            seed: () =>
                tUser.copyWith(ownFlashcard: ['flashcardSet/$tFlashcardId']),
            act: (_) {
              final result =
                  cubit.containtFlashcardSet(flashcardSetId: tFlashcardId);
              expect(result, true);
            },
          );

          blocTest<UserCubit, User?>(
            'should return false if toLearn is empty and ownFlashcard not contain the flashcardSetId',
            build: () => cubit,
            seed: () => tUser.copyWith(ownFlashcard: ['flashcardSet/2']),
            act: (_) {
              final result =
                  cubit.containtFlashcardSet(flashcardSetId: tFlashcardId);
              expect(result, false);
            },
          );

          blocTest<UserCubit, User?>(
            'should return true if toLearn contain the flashcard with id and ownFlashcard not contain the flashcardSetId',
            build: () => cubit,
            seed: () => tUser.copyWith(
              ownFlashcard: ['flashcardSet/2'],
              toLearn: [toLearn],
            ),
            act: (_) {
              final result = cubit.containtFlashcardSet(
                flashcardSetId: '1',
              );
              expect(result, true);
            },
          );
        },
      );
    },
  );
}
