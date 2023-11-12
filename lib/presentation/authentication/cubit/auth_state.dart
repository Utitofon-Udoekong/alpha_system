part of 'auth_cubit.dart';

@freezed
/// Authentication cubit state
class AuthState with _$AuthState {
  /// Factory constructor for cubit state. Sealed classes with freezed
  const factory AuthState(
      {required String username,
      required String password,
      required bool obscureText,
      required bool isLoading,
      required String success,
      required String failure,}) = _AuthState;
  /// empty factory state
  factory AuthState.empty() => const AuthState(
      password: '',
      username: '',
      obscureText: true,
      isLoading: false,
      success: '',
      failure: '',);
}
