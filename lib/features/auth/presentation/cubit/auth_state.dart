part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authorized({
    required User user,
  }) = _Authorized;
  const factory AuthState.created({
    required User user,
  }) = _Created;
  const factory AuthState.notAuthorized() = _NotAuthorized;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error({required String errorCode}) = _Error;
}
