import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_learn_state.dart';
part 'to_learn_cubit.freezed.dart';

class ToLearnCubit extends Cubit<ToLearnState> {
  ToLearnCubit() : super(const ToLearnState.initial());
}
