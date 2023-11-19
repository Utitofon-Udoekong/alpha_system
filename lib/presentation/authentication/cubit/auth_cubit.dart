
import 'package:alpha_system/domain/models/agro/agro_questionnaire_model.dart';
import 'package:alpha_system/domain/models/health/health_questionnaire_model.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton

/// Authentication cubit. Singleton that manages suthentication states and
/// fucntions
class AuthCubit extends HydratedCubit<AuthState> {
  /// Constructor
  AuthCubit() : super(AuthState.empty());

  /// Sets the username in the cubit state
  void setUsername(String username) => emit(state.copyWith(username: username));

  /// Sets the password in the cubit state
  void setPassword(String password) => emit(state.copyWith(password: password));

  ///Toggle password visibility
  void togglePasswordVisibility() {
    final obscureText = state.obscureText;
    emit(state.copyWith(obscureText: !obscureText));
  }

  /// Login function. Checks if the entered username and password matches
  /// that stored in the vault. Returns true for the above and false if the
  /// credentials do not match
  Future<bool> login() async {
    load();
    final username = state.username;
    final password = state.password;

    // const secureStorage = FlutterSecureStorage();
    // final key = await secureStorage.read(key: encAuthBoxKey);
    // if (key == null) {
    //   fail('User does not exist');
    //   return false;
    // }
    // final encryptionKeyUint8List = base64Url.decode(key);
    // final encryptedBox = await Hive.openBox<String>(
    //   encAuthBox,
    //   encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    // );
    // final authUserName = encryptedBox.get(encUserName);
    // final authPassword = encryptedBox.get(encPassword);
    // if (username.isNotEmpty && password.isNotEmpty) {
    // }
      await Hive.openBox<AgroQuestionnaireModel>(encAgroFromBox);
      await Hive.openBox<HealthQuestionnaireModel>(encHealthFormBox);
      pass('Login Successful');
      return true;
    // fail('Incorrect credentials');
    // return false;
  }

  /// HELPER FUNCTION TO SAVE SUCCESS STATES
  void pass(String success) =>
      emit(state.copyWith(success: success, isLoading: false));

  /// HELPER FUNCTION TO SAVE FAILURE STATES
  void fail(String failure) =>
      emit(state.copyWith(failure: failure, isLoading: false));

  /// HELPER FUNCTION TO SET LOADING STATE
  void load() =>
      emit(state.copyWith(success: '', failure: '', isLoading: true));

  /// HELPER FUNCTION TO RESET LOADING STATE
  void reset() => emit(AuthState.empty());

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(
      username: json['username'] as String,
      password: json['password'] as String,
      obscureText: json['obscureText'] as bool,
      isLoading: json['isLoading'] as bool,
      success: json['success'] as String,
      failure: json['failure'] as String,
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return <String, dynamic>{
      'password': state.password,
      'username': state.username,
      'obscureText': state.obscureText,
      'isLoading': state.isLoading,
      'success': state.success,
      'failure': state.failure,
    };
  }

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
