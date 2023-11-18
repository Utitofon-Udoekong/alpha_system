part of 'questionnaire_cubit.dart';

@freezed
/// Authentication cubit state
class QuestionnaireState with _$QuestionnaireState {
  /// Factory constructor for cubit state. Sealed classes with freezed
  const factory QuestionnaireState(
      {
        required String username,
        required String password,
        required String surname,
      required String otherNames,
      required int age,
      required Gender gender,
      required MaritalStatus maritalStatus,
      required int noOfChildren,
      required int noOfSpouses,
      required String nextOfKin,
      required String contactNumber,
      required String altContactNumber,
      required String phoneNumberOfNextOfKin,
      required bool obscureText,
      required bool isLoading,
      required String success,
      required String failure,
      }) = _QuestionnaireState;
  /// empty factory state
  factory QuestionnaireState.empty() => const QuestionnaireState(
        surname: '',
        username: '',
        password: '',
        otherNames: '',
        age: 0,
        gender: Gender.male,
        maritalStatus: MaritalStatus.Single,
        noOfChildren: 0,
        noOfSpouses: 0,
        nextOfKin: '',
        contactNumber: '',
        altContactNumber: '',
        phoneNumberOfNextOfKin: '',
        obscureText: true,
        isLoading: false,
        success: '',
        failure: '',
      );
}