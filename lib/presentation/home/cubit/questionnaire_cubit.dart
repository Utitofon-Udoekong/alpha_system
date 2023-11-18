import 'dart:convert';

import 'package:alpha_system/domain/models/agro/agro_questionnaire_model.dart';
import 'package:alpha_system/domain/models/health/health_questionnaire_model.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'questionnaire_cubit.freezed.dart';
part 'questionnaire_state.dart';

@lazySingleton

/// Authentication cubit. Singleton that manages suthentication states and
/// fucntions
class QuestionnaireCubit extends HydratedCubit<QuestionnaireState> {
  /// Constructor
  QuestionnaireCubit() : super(QuestionnaireState.empty());

  /// Sets the name in the cubit state
  void setName(String name) => emit(state.copyWith(name: name));

  /// Sets Other users name in the cubit state
  void setAge(int age) =>
      emit(state.copyWith(age: age));

  /// Sets the age in the cubit state
  void setAge(int age) => emit(state.copyWith(age: age));

  /// Sets the gender in the cubit state
  void setGender(String gender) => emit(state.copyWith(gender: gender));

  /// Sets the marital status in the cubit state
  void setMaritalStatus(String maritalStatus) =>
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

  /// Signup function. Creates a vault and stores the username and password.
  /// Returns true for the above
  Future<bool> saveAgroForm() async {
    load();

    // final surname = state.surname;
    // final otherNames = state.otherNames;
    // final age = state.age;
    // final gender = state.gender;
    // final maritalStatus = state.maritalStatus;
    // final numberOfChildren = state.noOfChildren;
    // final numberOfSpouses = state.noOfSpouses;
    // final nextOfKin = state.nextOfKin;
    // final contactNumber = state.contactNumber;
    // final altContactNumber = state.altContactNumber;
    // final phoneNumberOfNextOfKin = state.phoneNumberOfNextOfKin;

    // final newUser = AgroQuestionnaireModel(
    //     name: name,
    //     gender: gender,
    //     age: age,
    //     educationalLevel: educationalLevel,
    //     lga: lga,
    //     ward: ward,
    //     village: village,
    //     phone: phone,
    //     yearsOfFarming: yearsOfFarming,
    //     typeofFarming: typeofFarming,
    //     sizeOfFarm: sizeOfFarm,
    //     cropsGrown: cropsGrown,
    //     livestockRaised: livestockRaised,
    //     methodOfFarming: methodOfFarming,
    //     typesOfMachineryNeeded: typesOfMachineryNeeded,
    //     phoneOfNextOfKin: phoneOfNextOfKin,
    //     useAgroChemicals: useAgroChemicals,
    //     useFertilizer: useFertilizer,
    //     preferredFertilizers: preferredFertilizers,
    //     nin: nin,
    //     residentialAddress: residentialAddress,
    //     farmAddress: farmAddress,
    //     bankName: bankName,
    //     accountNumber: accountNumber,
    //     bvn: bvn,
    //     farmersGroup: farmersGroup);
    // final healthModel = HealthQuestionnaireModel(
    //     name: name,
    //     lga: lga,
    //     ward: ward,
    //     gpsLocation: gpsLocation,
    //     photoOfSignPost: photoOfSignPost,
    //     typeOfCareCenter: typeOfCareCenter,
    //     howManyCareCenters: howManyCareCenters,
    //     whatTypeOfRoad: whatTypeOfRoad,
    //     howManyAmbulances: howManyAmbulances,
    //     sourceOfPower: sourceOfPower,
    //     numberOfSurgeons: numberOfSurgeons,
    //     numberOfDoctors: numberOfDoctors,
    //     numberOfNurses: numberOfNurses,
    //     numberOfNursingAssistants: numberOfNursingAssistants,
    //     numberOfPharmacists: numberOfPharmacists,
    //     numberOfLabTechnicians: numberOfLabTechnicians,
    //     numberOfCleaners: numberOfCleaners,
    //     numberOfDispensaryAssistant: numberOfDispensaryAssistant,
    //     numberOfCommunityHealthOfficers: numberOfCommunityHealthOfficers,
    //     numberOfRecordOfficers: numberOfRecordOfficers,
    //     measuresInplaceForDiseaseControl: measuresInplaceForDiseaseControl,
    //     responseMechanismsToHealthEmergencies:
    //         responseMechanismsToHealthEmergencies,
    //     availabilityOfCommunityHealthPrograms:
    //         availabilityOfCommunityHealthPrograms,
    //     outreachProgramsForRuralAreas: outreachProgramsForRuralAreas,
    //     presenceOfHealthEducationPrograms: presenceOfHealthEducationPrograms,
    //     accessibilityOfHealthInformationToThePublic:
    //         accessibilityOfHealthInformationToThePublic,
    //     accessibilityOfHealthServicesToDifferentDemographics:
    //         accessibilityOfHealthServicesToDifferentDemographics,
    //     governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
    //         governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,
    //     investmentsAimedatImprovingHealthcareServices:
    //         investmentsAimedatImprovingHealthcareServices,
    //     collectionOfPublicHealthData: collectionOfPublicHealthData,
    //     surveillanceSystemsForMonitoringHealthTrends:
    //         surveillanceSystemsForMonitoringHealthTrends,
    //     environmentalHealthManagementFacilities:
    //         environmentalHealthManagementFacilities,
    //     doYouHaveAWASHProgram: doYouHaveAWASHProgram,
    //     doYouHaveAGoodRefuseDisposalSystemIncenerator:
    //         doYouHaveAGoodRefuseDisposalSystemIncenerator);

    const secureStorage = FlutterSecureStorage();
    final encryptionKey = await secureStorage.read(key: encAuthBoxKey);
    if (encryptionKey != null) {
      // fail('User already exists. Login instead!');
      return false;
    }
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: encAuthBoxKey,
      value: base64UrlEncode(key),
    );
    final encryptionKeyUint8List = key;
    final encryptedAgroQuestionnaireBox =
        await Hive.openBox<AgroQuestionnaireModel>(
      encAgroFromBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    // await encryptedAgroQuestionnaireBox.add(newUser);
    // await newUser.save();
    pass('Form saved to device');
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
  void reset() => emit(QuestionnaireState.empty());

  @override
  QuestionnaireState? fromJson(Map<String, dynamic> json) {
    return QuestionnaireState(
      isLoading: json['isLoading'] as bool,
      success: json['success'] as String,
      failure: json['failure'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      educationalLevel: json['educationalLevel'] as String,
      lga: json['lga'] as String,
      ward: json['ward'] as String,
      village: json['village'] as String,
      phone: json['phone'] as String,
      yearsOfFarming: json['yearsOfFarming'] as int,
      typeofFarming: json['typeofFarming'] as String,
      sizeOfFarm: json['sizeOfFarm'] as double,
      cropsGrown: json['cropsGrown'] as List<String>,
      livestockRaised: json['livestockRaised'] as List<String>,
      methodOfFarming: json['methodOfFarming'] as List<String>,
      typesOfMachineryNeeded: json['typesOfMachineryNeeded'] as List<String>,
      phoneOfNextOfKin: json['phoneOfNextOfKin'] as String,
      useAgroChemicals: json['useAgroChemicals'] as bool,
      useFertilizer: json['useFertilizer'] as bool,
      preferredFertilizers: json['preferredFertilizers'] as List<String>,
      nin: json['nin'] as String,
      residentialAddress: json['residentialAddress'] as String,
      farmAddress: json['farmAddress'] as String,
      bankName: json['bankName'] as String,
      accountNumber: json['accountNumber'] as String,
      bvn: json['bvn'] as String,
      farmersGroup: json['farmersGroup'] as String,
      gpsLocation: json['gpsLocation'] as String,
      photoOfSignPost: json['photoOfSignPost'] as String,
      typeOfCareCenter: json['typeOfCareCenter'] as String,
      howManyCareCenters: json['howManyCareCenters'] as int,
      whatTypeOfRoad: json['whatTypeOfRoad'] as String,
      howManyAmbulances: json['howManyAmbulances'] as int,
      sourceOfPower: json['sourceOfPower'] as String,
      numberOfSurgeons: json['numberOfSurgeons'] as int,
      numberOfDoctors: json['numberOfDoctors'] as int,
      numberOfNurses: json['numberOfNurses'] as int,
      numberOfNursingAssistants: json['numberOfNursingAssistants'] as int,
      numberOfPharmacists: json['numberOfPharmacists'] as int,
      numberOfLabTechnicians: json['numberOfLabTechnicians'] as int,
      numberOfCleaners: json['numberOfCleaners'] as int,
      numberOfDispensaryAssistant: json['numberOfDispensaryAssistant'] as int,
      numberOfCommunityHealthOfficers:
          json['numberOfCommunityHealthOfficers'] as int,
      numberOfRecordOfficers: json['numberOfRecordOfficers'] as int,
      measuresInplaceForDiseaseControl:
          json['measuresInplaceForDiseaseControl'] as bool,
      responseMechanismsToHealthEmergencies:
          json['responseMechanismsToHealthEmergencies'] as bool,
      availabilityOfCommunityHealthPrograms:
          json['availabilityOfCommunityHealthPrograms'] as String,
      outreachProgramsForRuralAreas:
          json['outreachProgramsForRuralAreas'] as String,
      presenceOfHealthEducationPrograms:
          json['presenceOfHealthEducationPrograms'] as bool,
      accessibilityOfHealthInformationToThePublic:
          json['accessibilityOfHealthInformationToThePublic'] as bool,
      accessibilityOfHealthServicesToDifferentDemographics:
          json['accessibilityOfHealthServicesToDifferentDemographics']
              as String,
      governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
          json['governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy']
              as bool,
      investmentsAimedatImprovingHealthcareServices:
          json['investmentsAimedatImprovingHealthcareServices'] as bool,
      collectionOfPublicHealthData:
          json['collectionOfPublicHealthData'] as String,
      surveillanceSystemsForMonitoringHealthTrends:
          json['surveillanceSystemsForMonitoringHealthTrends'] as String,
      environmentalHealthManagementFacilities:
          json['environmentalHealthManagementFacilities'] as String,
      doYouHaveAWASHProgram: json['doYouHaveAWASHProgram'] as bool,
      doYouHaveAGoodRefuseDisposalSystemIncenerator:
          json['doYouHaveAGoodRefuseDisposalSystemIncenerator'] as bool,
    );
  }

  @override
  Map<String, dynamic>? toJson(QuestionnaireState state) {
    return <String, dynamic>{
      'isLoading': state.isLoading,
      'success': state.success,
      'failure': state.failure,
      'name': state.name,
      'gender': state.gender,
      'age': state.age,
      'educationalLevel': state.educationalLevel,
      'lga': state.lga,
      'ward': state.ward,
      'village': state.village,
      'phone': state.phone,
      'yearsOfFarming': state.yearsOfFarming,
      'typeofFarming': state.typeofFarming,
      'sizeOfFarm': state.sizeOfFarm,
      'cropsGrown': state.cropsGrown,
      'livestockRaised': state.livestockRaised,
      'methodOfFarming': state.methodOfFarming,
      'typesOfMachineryNeeded': state.typesOfMachineryNeeded,
      'phoneOfNextOfKin': state.phoneOfNextOfKin,
      'useAgroChemicals': state.useAgroChemicals,
      'useFertilizer': state.useFertilizer,
      'preferredFertilizers': state.preferredFertilizers,
      'nin': state.nin,
      'residentialAddress': state.residentialAddress,
      'farmAddress': state.farmAddress,
      'bankName': state.bankName,
      'accountNumber': state.accountNumber,
      'bvn': state.bvn,
      'farmersGroup': state.farmersGroup,
      'gpsLocation': state.gpsLocation,
      'photoOfSignPost': state.photoOfSignPost,
      'typeOfCareCenter': state.typeOfCareCenter,
      'howManyCareCenters': state.howManyCareCenters,
      'whatTypeOfRoad': state.whatTypeOfRoad,
      'howManyAmbulances': state.howManyAmbulances,
      'sourceOfPower': state.sourceOfPower,
      'numberOfSurgeons': state.numberOfSurgeons,
      'numberOfDoctors': state.numberOfDoctors,
      'numberOfNurses': state.numberOfNurses,
      'numberOfNursingAssistants': state.numberOfNursingAssistants,
      'numberOfPharmacists': state.numberOfPharmacists,
      'numberOfLabTechnicians': state.numberOfLabTechnicians,
      'numberOfCleaners': state.numberOfCleaners,
      'numberOfDispensaryAssistant': state.numberOfDispensaryAssistant,
      'numberOfCommunityHealthOfficers': state.numberOfCommunityHealthOfficers,
      'numberOfRecordOfficers': state.numberOfRecordOfficers,
      'measuresInplaceForDiseaseControl':
          state.measuresInplaceForDiseaseControl,
      'responseMechanismsToHealthEmergencies':
          state.responseMechanismsToHealthEmergencies,
      'availabilityOfCommunityHealthPrograms':
          state.availabilityOfCommunityHealthPrograms,
      'outreachProgramsForRuralAreas': state.outreachProgramsForRuralAreas,
      'presenceOfHealthEducationPrograms':
          state.presenceOfHealthEducationPrograms,
      'accessibilityOfHealthInformationToThePublic':
          state.accessibilityOfHealthInformationToThePublic,
      'accessibilityOfHealthServicesToDifferentDemographics':
          state.accessibilityOfHealthServicesToDifferentDemographics,
      'governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy': state
          .governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,
      'investmentsAimedatImprovingHealthcareServices':
          state.investmentsAimedatImprovingHealthcareServices,
      'collectionOfPublicHealthData': state.collectionOfPublicHealthData,
      'surveillanceSystemsForMonitoringHealthTrends':
          state.surveillanceSystemsForMonitoringHealthTrends,
      'environmentalHealthManagementFacilities':
          state.environmentalHealthManagementFacilities,
      'doYouHaveAWASHProgram': state.doYouHaveAWASHProgram,
      'doYouHaveAGoodRefuseDisposalSystemIncenerator':
          state.doYouHaveAGoodRefuseDisposalSystemIncenerator,
    };
  }

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
