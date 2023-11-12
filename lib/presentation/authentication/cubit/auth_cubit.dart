import 'dart:convert';

import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:alpha_system/presentation/constants/methods.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: encAuthBoxKey);
    if (key == null) {
      fail('User does not exist');
      return false;
    }
    final encryptionKeyUint8List = base64Url.decode(key);
    final encryptedBox = await Hive.openBox<String>(
      encAuthBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );
    final authUserName = encryptedBox.get(encUserName);
    final authPassword = encryptedBox.get(encPassword);
    if (username == authUserName && password == authPassword) {
      await Hive.openBox<FarmList>(farmInventoryBox);
      pass('Login Successful');
      return true;
    }
    fail('Incorrect credentials');
    return false;
  }

  /// Signup function. Creates a vault and stores the username and password.
  /// Returns true for the above
  Future<bool> signup() async {
    load();
    final username = state.username;
    final password = state.password;
    if (!isValidPassword(password)) {
      if (password.length < 8) {
        fail('Password must be atleast 8 characters');
        return false;
      } else if (!password.contains(RegExp(r'[#?!@$%^&*-]'))) {
        fail('Password must contain a special character. E.g @,#,*');
        return false;
      } else if (!password.contains(RegExp('[0-9]'))) {
        fail('Password must contain a number');
        return false;
      } else {
        fail('Password must contain a letter');
        return false;
      }
    }
    const secureStorage = FlutterSecureStorage();
    final encryptionKey = await secureStorage.read(key: encAuthBoxKey);
    if (encryptionKey != null) {
      fail('User already exists. Login instead!');
      return false;
    }
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: encAuthBoxKey,
      value: base64UrlEncode(key),
    );
    final encryptionKeyUint8List = key;
    final encryptedBox = await Hive.openBox<String>(
      encAuthBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    await encryptedBox.put(encUserName, username);
    await encryptedBox.put(encPassword, password);
    await Hive.openBox<FarmList>(farmInventoryBox);
    pass('Registration successful');
    return true;
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
  void reset() => emit(state.copyWith(
        username: '',
        password: '',
        failure: '',
        success: '',
        isLoading: false,
      ));

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
      'failure': state.failure
    };
  }

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
