import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../exception/busy_nickname.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../utils/firebase_error.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepo,
    required this.firestore,
  }) : super(const AuthState.initial()) {
    _init();
  }
  final AuthRepository authRepo;
  final FirebaseFirestore firestore;

  void _init() {
    authRepo.isUserLoggin().listen((user) {
      if (user != null) {
        emit(AuthState.authorized(user: user));
      } else {
        emit(const AuthState.initial());
      }
    });
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    final result = await authRepo.logIn(
      email: email,
      password: password,
    );

    result.fold(
      (l) => emit(AuthState.error(errorCode: l)),
      (r) => emit(AuthState.authorized(user: r.user!)),
    );
  }

  Future<void> logOut() async {
    await authRepo.logOut();
    emit(const AuthState.notAuthorized());
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String nickname,
  }) async {
    emit(const AuthState.loading());
    try {
      await authRepo.checkNickname(nickname: nickname);
    } on BusyNickname catch (_) {
      emit(const AuthState.error(errorCode: nicknameBusy));
      return;
    }

    final result = await authRepo.createAccount(
      email: email,
      password: password,
      nickname: nickname,
    );

    result.fold(
      (l) => emit(AuthState.error(errorCode: l)),
      (r) => emit(AuthState.authorized(user: r.user!)),
    );
  }

  Future<void> resetPassword({required String email}) async {
    emit(const AuthState.loading());
    // TODO NIE WIEM JAKA TO JESZCZE ZROBIC JAKI STAN ZWRÓCIC
    final result = await authRepo.resetPassword(email: email);

    throw UnimplementedError();
  }
}
