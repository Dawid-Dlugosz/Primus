import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_flash_state.dart';
part 'create_flash_cubit.freezed.dart';

class CreateFlashCubit extends Cubit<CreateFlashState> {
  CreateFlashCubit() : super(CreateFlashState.initial());
}
