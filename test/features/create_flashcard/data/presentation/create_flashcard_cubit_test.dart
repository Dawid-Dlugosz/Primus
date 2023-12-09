import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/create_flashcard/domain/repository/create_flash_card_repository.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/create_flashcard_cubit.dart';

class MockFlashcardRepository extends Mock
    implements CreateFlashcardRepository {}

void main() {
  late CreateFlashcardCubit cubit;
  late MockFlashcardRepository repository;
  setUp(() {
    repository = MockFlashcardRepository();
    cubit = CreateFlashcardCubit(
      flashcardRepository: repository,
    );
  });

  group(
    'CreateFlashcardCubit',
    () {
      test(
        'should emit initstate',
        () {
          expect(cubit.state, const CreateFlashcardState.initial());
        },
      );

      blocTest(
        'should emit error state with toShort code',
        build: () => cubit,
        act: (_) async {
          when(
            () => repository.createFlashcardSet(
              name: any(named: 'name'),
              language: any(named: 'language'),
              words: [],
              definitions: [],
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.tooShort()),
          );

          cubit.createFlashcardSet(
            name: 'name',
            language: 'language',
            words: [],
            definitions: [],
          );
        },
        expect: () => [
          const CreateFlashcardState.loadind(),
          const CreateFlashcardState.error(
            errorMessage: CreateFlashcardError.tooShort,
          )
        ],
      );

      blocTest(
        'should emit error state with nameBusy code',
        build: () => cubit,
        act: (_) async {
          when(
            () => repository.createFlashcardSet(
              name: any(named: 'name'),
              language: any(named: 'language'),
              words: [],
              definitions: [],
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.flashcardNameBuse()),
          );

          cubit.createFlashcardSet(
            name: 'name',
            language: 'language',
            words: [],
            definitions: [],
          );
        },
        expect: () => [
          const CreateFlashcardState.loadind(),
          const CreateFlashcardState.error(
            errorMessage: CreateFlashcardError.nameBusy,
          )
        ],
      );

      blocTest(
        'should emit error state with general code',
        build: () => cubit,
        act: (_) async {
          when(
            () => repository.createFlashcardSet(
              name: any(named: 'name'),
              language: any(named: 'language'),
              words: [],
              definitions: [],
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.general()),
          );

          cubit.createFlashcardSet(
            name: 'name',
            language: 'language',
            words: [],
            definitions: [],
          );
        },
        expect: () => [
          const CreateFlashcardState.loadind(),
          const CreateFlashcardState.error(
            errorMessage: CreateFlashcardError.general,
          )
        ],
      );

      blocTest(
        'should emit succes with flashcardSet id',
        build: () => cubit,
        act: (_) async {
          when(
            () => repository.createFlashcardSet(
              name: any(named: 'name'),
              language: any(named: 'language'),
              words: [],
              definitions: [],
            ),
          ).thenAnswer((_) async => const Right('test-value'));

          cubit.createFlashcardSet(
            name: 'name',
            language: 'language',
            words: [],
            definitions: [],
          );
        },
        expect: () => [
          const CreateFlashcardState.loadind(),
          const CreateFlashcardState.success(
            flashcardSetId: 'test-value',
          )
        ],
      );
    },
  );
}
