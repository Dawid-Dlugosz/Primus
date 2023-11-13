import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_flashcard_state.dart';
part 'create_flashcard_cubit.freezed.dart';

class CreateFlashcardCubit extends Cubit<CreateFlashcardState> {
  CreateFlashcardCubit() : super(CreateFlashcardState.initial());
}
