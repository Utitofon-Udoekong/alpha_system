import 'dart:convert';

import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/domain/models/user_model.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
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

  /// Sets the surname in the cubit state
  void setSurname(String surname) => emit(state.copyWith(surname: surname));

  /// Sets Other users name in the cubit state
  void setOtherNames(String otherNames) =>
      emit(state.copyWith(otherNames: otherNames));

  /// Sets the age in the cubit state
  void setAge(int age) => emit(state.copyWith(age: age));

  /// Sets the gender in the cubit state
  void setGender(Gender gender) => emit(state.copyWith(gender: gender));

  /// Sets the marital status in the cubit state
  void setMaritalStatus(MaritalStatus maritalStatus) =>
      emit(state.copyWith(maritalStatus: maritalStatus));

  /// Sets the number of children in the cubit state
  void setNoOfChildren(int noOfChildren) =>
      emit(state.copyWith(noOfChildren: noOfChildren));

  /// Sets the numbe rof spouses in the cubit state
  void setNoOfSpouses(int noOfSpouses) =>
      emit(state.copyWith(noOfSpouses: noOfSpouses));

  /// Sets the next of kin in the cubit state
  void setNextOfKin(String nextOfKin) =>
      emit(state.copyWith(nextOfKin: nextOfKin));

  /// Sets the contact number in the cubit state
  void setContactNumber(String contactNumber) =>
      emit(state.copyWith(contactNumber: contactNumber));

  /// Sets the alternate contact number in the cubit state
  void setAltContactNumber(String altContactNumber) =>
      emit(state.copyWith(altContactNumber: altContactNumber));

  /// Sets the contact number of the next of kin in the cubit state
  void setPhoneNumberOfNextOfKin(String phoneNumberOfNextOfKin) =>
      emit(state.copyWith(phoneNumberOfNextOfKin: phoneNumberOfNextOfKin));

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
    if (username.isNotEmpty && password.isNotEmpty) {
      await Hive.openBox<UserModel>(userModelBox);
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

    final surname = state.surname;
    final otherNames = state.otherNames;
    final age = state.age;
    final gender = state.gender;
    final maritalStatus = state.maritalStatus;
    final numberOfChildren = state.noOfChildren;
    final numberOfSpouses = state.noOfSpouses;
    final nextOfKin = state.nextOfKin;
    final contactNumber = state.contactNumber;
    final altContactNumber = state.altContactNumber;
    final phoneNumberOfNextOfKin = state.phoneNumberOfNextOfKin;

    final newUser = UserModel(
      surname: surname,
      otherNames: otherNames,
      age: age,
      gender: gender,
      maritalStatus: maritalStatus,
      numberOfSpouses: numberOfSpouses,
      numberOfChildren: numberOfChildren,
      nextOfKin: nextOfKin,
      contactNumber: contactNumber,
      altContactNumber: altContactNumber,
      phoneOfNextOfKin: phoneNumberOfNextOfKin,
    );

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
    final encryptedUserBox = await Hive.openBox<UserModel>(
      userModelBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    await encryptedUserBox.add(newUser);
    await newUser.save();
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
      surname: json['surname'] as String,
      otherNames: json['otherNames'] as String,
      age: json['age'] as int,
      gender: json['gender'] as Gender,
      maritalStatus: json['maritalStatus'] as MaritalStatus,
      noOfChildren: json['noOfChildren'] as int,
      noOfSpouses: json['noOfSpouses'] as int,
      nextOfKin: json['nextOfKin'] as String,
      contactNumber: json['contactNumber'] as String,
      altContactNumber: json['altContactNumber'] as String,
      phoneNumberOfNextOfKin: json['phoneNumberOfNextOfKin'] as String,
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
      'surname': state.surname,
      'otherNames': state.otherNames,
      'age': state.age,
      'gender': state.gender.name,
      'maritalStatus': state.maritalStatus.name,
      'noOfChildren': state.noOfChildren,
      'noOfSpouses': state.noOfSpouses,
      'nextOfKin': state.nextOfKin,
      'contactNumber': state.contactNumber,
      'altContactNumber': state.altContactNumber,
      'phoneNumberOfNextOfKin': state.phoneNumberOfNextOfKin,
    };
  }

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
