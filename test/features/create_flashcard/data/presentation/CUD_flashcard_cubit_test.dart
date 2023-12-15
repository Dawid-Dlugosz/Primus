import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/core/failure.dart';
import 'package:primus/features/create_flashcard/domain/repository/create_flash_card_repository.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/cud_flashcard_cubit.dart';

class MockFlashcardRepository extends Mock implements FlashcardRepository {}

void main() {
  late CUDFlashcardCubit cubit;
  late MockFlashcardRepository repository;
  setUp(() {
    repository = MockFlashcardRepository();
    cubit = CUDFlashcardCubit(
      flashcardRepository: repository,
    );
  });
  const tFlashcardId = 'tFlashcardId';
  group(
    'CreateFlashcardCubit',
    () {
      test(
        'should emit initstate',
        () {
          expect(cubit.state, const CUDFlashcardState.initial());
        },
      );
      group('createFlashcardSet function', () {
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
            const CUDFlashcardState.loadind(),
            const CUDFlashcardState.error(
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
            const CUDFlashcardState.loadind(),
            const CUDFlashcardState.error(
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
            const CUDFlashcardState.loadind(),
            const CUDFlashcardState.error(
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
            const CUDFlashcardState.loadind(),
            const CUDFlashcardState.success(
              flashcardSetId: 'test-value',
            )
          ],
        );

        group(
          'deleteFlashcard function',
          () {
            blocTest(
              'should emit [Success] if repo return right',
              build: () => cubit,
              act: (_) {
                when(
                  () => repository.deleteFlashcardSet(
                    flashcardId: any(named: 'flashcardId'),
                  ),
                ).thenAnswer((_) async => const Right(unit));

                cubit.deleteFlashcardSet(flashcardId: tFlashcardId);
              },
              expect: () => [
                const CUDFlashcardState.loadind(),
                const CUDFlashcardState.success(flashcardSetId: tFlashcardId),
              ],
            );

            blocTest(
              'should emit [Error] if repo return left',
              build: () => cubit,
              act: (_) {
                when(
                  () => repository.deleteFlashcardSet(
                    flashcardId: any(named: 'flashcardId'),
                  ),
                ).thenAnswer((_) async => const Left(Failure.flashcard()));

                cubit.deleteFlashcardSet(flashcardId: tFlashcardId);
              },
              expect: () => [
                const CUDFlashcardState.loadind(),
                const CUDFlashcardState.error(
                    errorMessage: CreateFlashcardError.delete),
              ],
            );
          },
        );
      });
    },
  );
}
