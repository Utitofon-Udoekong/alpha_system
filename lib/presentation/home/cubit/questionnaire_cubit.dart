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

/// Authentication cubit. Singleton that manages authentication states and
/// fucntions
class QuestionnaireCubit extends HydratedCubit<QuestionnaireState> {
  /// Constructor
  QuestionnaireCubit() : super(QuestionnaireState.empty());

  /// Sets the name in the cubit state
  void setName(String name) => emit(state.copyWith(name: name));

  /// Sets the age in the cubit state
  void setAge(String age) => emit(state.copyWith(age: age));

  /// Sets the gender in the cubit state
  void setGender(String gender) => emit(state.copyWith(gender: gender));

  /// Sets the marital status in the cubit state
  void setEducationalLevel(String educationalLevel) =>
      emit(state.copyWith(educationalLevel: educationalLevel));

  /// Sets the LGA in the cubit state
  void setLGA(String lga) {
    emit(state.copyWith(lga: lga, ward: 'SELECT WARD'));
  }

  /// Sets the ward in the cubit state
  void setWard(String ward) => emit(state.copyWith(ward: ward));

  /// Sets the village in the cubit state
  void setVillage(String village) => emit(state.copyWith(village: village));

  /// Sets the contact number in the cubit state
  void setPhone(String phone) => emit(state.copyWith(phone: phone));

  /// Sets the yearsOfFarming in the cubit state
  void setYearsOfFarming(int yearsOfFarming) =>
      emit(state.copyWith(yearsOfFarming: yearsOfFarming));

  /// Sets the typeofFarming in the cubit state
  void setTypeofFarming(String typeofFarming) =>
      emit(state.copyWith(typeofFarming: typeofFarming));

  /// Sets the sizeOfFarm in the cubit state
  void setSizeOfFarm(double sizeOfFarm) =>
      emit(state.copyWith(sizeOfFarm: sizeOfFarm));

  /// Sets the cropsGrown in the cubit state
  void setCropsGrown(String crops) {
    final selectedCrops = crops.split(',');
    print(selectedCrops);
    emit(state.copyWith(cropsGrown: selectedCrops));
  }

  /// Sets the livestockRaised in the cubit state
  void setLivestockRaised(String livestocks) {
    final selectedLivestocks = livestocks.split(',');
    print(selectedLivestocks);
    emit(state.copyWith(livestockRaised: selectedLivestocks));
  }

  /// Sets the methodOfFarming in the cubit state
  void setMethodOfFarming(String method) =>
      emit(state.copyWith(methodOfFarming: method));

  /// Sets the typesOfMachineryNeeded in the cubit state
  void setTypesOfMachineryNeeded(String machine) {
    final selectedMachinery = state.typesOfMachineryNeeded;
    if (selectedMachinery.contains(machine)) {
      selectedMachinery.remove(machine);
    } else {
      selectedMachinery.add(machine);
    }
    emit(state.copyWith(typesOfMachineryNeeded: selectedMachinery));
  }

  /// Sets the phoneOfNextOfKin in the cubit state
  void setPhoneOfNextOfKin(String phoneOfNextOfKin) =>
      emit(state.copyWith(phoneOfNextOfKin: phoneOfNextOfKin));

  /// Sets the useAgroChemicals in the cubit state
  void setUseAgroChemicals(bool useAgroChemicals) =>
      emit(state.copyWith(useAgroChemicals: useAgroChemicals));

  /// Sets the useFertilizer in the cubit state
  void setUseFertilizer(bool useFertilizer) =>
      emit(state.copyWith(useFertilizer: useFertilizer));

  /// Sets the preferredFertilizers in the cubit state
  void setPreferredFertilizers(String preferredFertilizers) {
    final selectedFertilizers = preferredFertilizers.split(',');
    print(selectedFertilizers);
    emit(state.copyWith(preferredFertilizers: selectedFertilizers));
  }

  /// Sets the nin in the cubit state
  void setNIN(String nin) => emit(state.copyWith(nin: nin));

  /// Sets the residentialAddress in the cubit state
  void setResidentialAddress(String residentialAddress) =>
      emit(state.copyWith(residentialAddress: residentialAddress));

  /// Sets the farmAddress in the cubit state
  void setFarmAddress(String farmAddress) =>
      emit(state.copyWith(farmAddress: farmAddress));

  /// Sets the bankName in the cubit state
  void setBankName(String bankName) => emit(state.copyWith(bankName: bankName));

  /// Sets the accountNumber in the cubit state
  void setAccountNumber(String accountNumber) =>
      emit(state.copyWith(accountNumber: accountNumber));

  /// Sets the bvn in the cubit state
  void setBVN(String bvn) => emit(state.copyWith(bvn: bvn));

  /// Sets the farmersGroup in the cubit state
  void setFarmersGroup(String farmersGroup) =>
      emit(state.copyWith(farmersGroup: farmersGroup));

  /// Sets the gpsLocation in the cubit state
  void setGpsLocation(String gpsLocation) =>
      emit(state.copyWith(gpsLocation: gpsLocation));

  /// Sets the photoOfSignPost in the cubit state
  void setPhotoOfSignPost(String photoOfSignPost) =>
      emit(state.copyWith(photoOfSignPost: photoOfSignPost));
      
  /// Sets the photoOfFront in the cubit state
  void setPhotoOfFront(String photoOfFront) =>
      emit(state.copyWith(photoOfFront: photoOfFront));

  /// Sets the photoOfSide in the cubit state
  void setPhotoOfSide(String photoOfSide) =>
      emit(state.copyWith(photoOfSide: photoOfSide));

  /// Sets the photoOfReception in the cubit state
  void setPhotoOfReception(String photoOfReception) =>
      emit(state.copyWith(photoOfReception: photoOfReception));

  /// Sets the typeOfCareCenter in the cubit state
  void setTypeOfCareCenter(String typeOfCareCenter) =>
      emit(state.copyWith(typeOfCareCenter: typeOfCareCenter));

  /// Sets the howManyCareCenters in the cubit state
  void setHowManyCareCenters(int howManyCareCenters) =>
      emit(state.copyWith(howManyCareCenters: howManyCareCenters));

  /// Sets the whatTypeOfRoad in the cubit state
  void setWhatTypeOfRoad(String whatTypeOfRoad) =>
      emit(state.copyWith(whatTypeOfRoad: whatTypeOfRoad));

  /// Sets the howManyAmbulances in the cubit state
  void setHowManyAmbulances(int howManyAmbulances) =>
      emit(state.copyWith(howManyAmbulances: howManyAmbulances));

  /// Sets the sourceOfPower in the cubit state
  void setSourceOfPower(String sourceOfPower) =>
      emit(state.copyWith(sourceOfPower: sourceOfPower));

  /// Sets the numberOfSurgeons in the cubit state
  void setNumberOfSurgeons(int numberOfSurgeons) =>
      emit(state.copyWith(numberOfSurgeons: numberOfSurgeons));

  /// Sets the numberOfDoctors in the cubit state
  void setNumberOfDoctors(int numberOfDoctors) =>
      emit(state.copyWith(numberOfDoctors: numberOfDoctors));

  /// Sets the numberOfNurses in the cubit state
  void setNumberOfNurses(int numberOfNurses) =>
      emit(state.copyWith(numberOfNurses: numberOfNurses));

  /// Sets the numberOfNursingAssistants in the cubit state
  void setNumberOfNursingAssistants(int numberOfNursingAssistants) => emit(
      state.copyWith(numberOfNursingAssistants: numberOfNursingAssistants));

  /// Sets the numberOfPharmacists in the cubit state
  void setNumberOfPharmacists(int numberOfPharmacists) =>
      emit(state.copyWith(numberOfPharmacists: numberOfPharmacists));

  /// Sets the numberOfLabTechnicians in the cubit state
  void setNumberOfLabTechnicians(int numberOfLabTechnicians) =>
      emit(state.copyWith(numberOfLabTechnicians: numberOfLabTechnicians));

  /// Sets the numberOfCleaners in the cubit state
  void setNumberOfCleaners(int numberOfCleaners) =>
      emit(state.copyWith(numberOfCleaners: numberOfCleaners));

  /// Sets the numberOfDispensaryAssistant in the cubit state
  void setNumberOfDispensaryAssistant(int numberOfDispensaryAssistant) => emit(
      state.copyWith(numberOfDispensaryAssistant: numberOfDispensaryAssistant));

  /// Sets the numberOfCommunityHealthOfficers in the cubit state
  void setNumberOfCommunityHealthOfficers(
          int numberOfCommunityHealthOfficers) =>
      emit(state.copyWith(
          numberOfCommunityHealthOfficers: numberOfCommunityHealthOfficers));

  /// Sets the numberOfRecordOfficers in the cubit state
  void setNumberOfRecordOfficers(int numberOfRecordOfficers) =>
      emit(state.copyWith(numberOfRecordOfficers: numberOfRecordOfficers));

  /// Sets the measuresInplaceForDiseaseControl in the cubit state
  void setMeasuresInplaceForDiseaseControl(
          bool measuresInplaceForDiseaseControl) =>
      emit(state.copyWith(
          measuresInplaceForDiseaseControl: measuresInplaceForDiseaseControl));

  /// Sets the responseMechanismsToHealthEmergencies in the cubit state
  void setResponseMechanismsToHealthEmergencies(
          bool responseMechanismsToHealthEmergencies) =>
      emit(state.copyWith(
          responseMechanismsToHealthEmergencies:
              responseMechanismsToHealthEmergencies));

  /// Sets the availabilityOfCommunityHealthPrograms in the cubit state
  void setAvailabilityOfCommunityHealthPrograms(
          String availabilityOfCommunityHealthPrograms) =>
      emit(state.copyWith(
          availabilityOfCommunityHealthPrograms:
              availabilityOfCommunityHealthPrograms));

  /// Sets the outreachProgramsForRuralAreas in the cubit state
  void setOutreachProgramsForRuralAreas(String outreachProgramsForRuralAreas) =>
      emit(state.copyWith(
          outreachProgramsForRuralAreas: outreachProgramsForRuralAreas));

  /// Sets the presenceOfHealthEducationPrograms in the cubit state
  void setPresenceOfHealthEducationPrograms(
          bool presenceOfHealthEducationPrograms) =>
      emit(state.copyWith(
          presenceOfHealthEducationPrograms:
              presenceOfHealthEducationPrograms));

  /// Sets the accessibilityOfHealthInformationToThePublic in the cubit state
  void setAccessibilityOfHealthInformationToThePublic(
          bool accessibilityOfHealthInformationToThePublic) =>
      emit(state.copyWith(
          accessibilityOfHealthInformationToThePublic:
              accessibilityOfHealthInformationToThePublic));

  /// Sets the accessibilityOfHealthServicesToDifferentDemographics in the cubit state
  void setAccessibilityOfHealthServicesToDifferentDemographics(
          String accessibilityOfHealthServicesToDifferentDemographics) =>
      emit(state.copyWith(
          accessibilityOfHealthServicesToDifferentDemographics:
              accessibilityOfHealthServicesToDifferentDemographics));

  /// Sets the governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy in the cubit state
  void setGovernmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy(
          bool
              governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy) =>
      emit(state.copyWith(
          governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
              governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy));

  /// Sets the investmentsAimedatImprovingHealthcareServices in the cubit state
  void setInvestmentsAimedatImprovingHealthcareServices(
          bool investmentsAimedatImprovingHealthcareServices) =>
      emit(state.copyWith(
          investmentsAimedatImprovingHealthcareServices:
              investmentsAimedatImprovingHealthcareServices));

  /// Sets the collectionOfPublicHealthData in the cubit state
  void setCollectionOfPublicHealthData(String collectionOfPublicHealthData) =>
      emit(state.copyWith(
          collectionOfPublicHealthData: collectionOfPublicHealthData));

  /// Sets the surveillanceSystemsForMonitoringHealthTrends in the cubit state
  void setSurveillanceSystemsForMonitoringHealthTrends(
          String surveillanceSystemsForMonitoringHealthTrends) =>
      emit(state.copyWith(
          surveillanceSystemsForMonitoringHealthTrends:
              surveillanceSystemsForMonitoringHealthTrends));

  /// Sets the environmentalHealthManagementFacilities in the cubit state
  void setEnvironmentalHealthManagementFacilities(
          String environmentalHealthManagementFacilities) =>
      emit(state.copyWith(
          environmentalHealthManagementFacilities:
              environmentalHealthManagementFacilities));

  /// Sets the doYouHaveAWASHProgram in the cubit state
  void setDoYouHaveAWASHProgram(bool doYouHaveAWASHProgram) =>
      emit(state.copyWith(doYouHaveAWASHProgram: doYouHaveAWASHProgram));

  /// Sets the doYouHaveAGoodRefuseDisposalSystemIncenerator in the cubit state
  void setDoYouHaveAGoodRefuseDisposalSystemIncenerator(
          bool doYouHaveAGoodRefuseDisposalSystemIncenerator) =>
      emit(state.copyWith(
          doYouHaveAGoodRefuseDisposalSystemIncenerator:
              doYouHaveAGoodRefuseDisposalSystemIncenerator));

  Future<void> clearQuestionnaires() async {
    const secureStorage = FlutterSecureStorage();
    final encryptionKey = await secureStorage.read(key: encAuthBoxKey);
    if(encryptionKey == null){
      print('Not initiated');
      return;
    }
    secureStorage.delete(key: encryptionKey);
    await Hive.deleteFromDisk();
  }

  /// Signup function. Creates a vault and stores the username and password.
  /// Returns true for the above
  Future<bool> saveAgroForm() async {
    load();

    final name = state.name;
    final gender = state.gender;
    final age = state.age;
    final educationalLevel = state.educationalLevel;
    final lga = state.lga;
    final ward = state.ward;
    final village = state.village;
    final phone = state.phone;
    final yearsOfFarming = state.yearsOfFarming;
    final typeofFarming = state.typeofFarming;
    final sizeOfFarm = state.sizeOfFarm;
    final cropsGrown = state.cropsGrown;
    final livestockRaised = state.livestockRaised;
    final methodOfFarming = state.methodOfFarming;
    final typesOfMachineryNeeded = state.typesOfMachineryNeeded;
    final phoneOfNextOfKin = state.phoneOfNextOfKin;
    final useAgroChemicals = state.useAgroChemicals;
    final useFertilizer = state.useFertilizer;
    final preferredFertilizers = state.preferredFertilizers;
    final nin = state.nin;
    final residentialAddress = state.residentialAddress;
    final farmAddress = state.farmAddress;
    final bankName = state.bankName;
    final accountNumber = state.accountNumber;
    final bvn = state.bvn;
    final farmersGroup = state.farmersGroup;

    final newForm = AgroQuestionnaireModel(
      name: name,
      gender: gender,
      age: age,
      educationalLevel: educationalLevel,
      lga: lga,
      ward: ward,
      village: village,
      phone: phone,
      yearsOfFarming: yearsOfFarming,
      typeofFarming: typeofFarming,
      sizeOfFarm: sizeOfFarm,
      cropsGrown: cropsGrown,
      livestockRaised: livestockRaised,
      methodOfFarming: methodOfFarming,
      typesOfMachineryNeeded: typesOfMachineryNeeded,
      phoneOfNextOfKin: phoneOfNextOfKin,
      useAgroChemicals: useAgroChemicals,
      useFertilizer: useFertilizer,
      preferredFertilizers: preferredFertilizers,
      nin: nin,
      residentialAddress: residentialAddress,
      farmAddress: farmAddress,
      bankName: bankName,
      accountNumber: accountNumber,
      bvn: bvn,
      farmersGroup: farmersGroup,
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    );

    const secureStorage = FlutterSecureStorage();
    final encryptionKey = await secureStorage.read(key: encAuthBoxKey);
    if(encryptionKey == null){
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: encAuthBoxKey,
        value: base64UrlEncode(key),
      );

    }

    final encryptionKeyUint8List = base64Decode(encryptionKey!);
    final encryptedAgroQuestionnaireBox =
        await Hive.openBox<AgroQuestionnaireModel>(
      encAgroFromBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    await encryptedAgroQuestionnaireBox.add(newForm);
    await newForm.save();
    pass(noNetworkFormSavedToDevice);
    return true;
  }

  /// Saves the health form
  Future<bool> saveHealthForm() async {
    load();
    final name = state.name;
    final lga = state.lga;
    final ward = state.ward;
    final gpsLocation = state.gpsLocation;
    final photoOfSignPost = state.photoOfSignPost;
    final photoOfFront = state.photoOfFront;
    final photoOfSide = state.photoOfSide;
    final photoOfReception = state.photoOfReception;
    final typeOfCareCenter = state.typeOfCareCenter;
    final howManyCareCenters = state.howManyCareCenters;
    final whatTypeOfRoad = state.whatTypeOfRoad;
    final howManyAmbulances = state.howManyAmbulances;
    final sourceOfPower = state.sourceOfPower;
    final numberOfSurgeons = state.numberOfSurgeons;
    final numberOfDoctors = state.numberOfDoctors;
    final numberOfNurses = state.numberOfNurses;
    final numberOfNursingAssistants = state.numberOfNursingAssistants;
    final numberOfPharmacists = state.numberOfPharmacists;
    final numberOfLabTechnicians = state.numberOfLabTechnicians;
    final numberOfCleaners = state.numberOfCleaners;
    final numberOfDispensaryAssistant = state.numberOfDispensaryAssistant;
    final numberOfCommunityHealthOfficers =
        state.numberOfCommunityHealthOfficers;
    final numberOfRecordOfficers = state.numberOfRecordOfficers;
    final measuresInplaceForDiseaseControl =
        state.measuresInplaceForDiseaseControl;
    final responseMechanismsToHealthEmergencies =
        state.responseMechanismsToHealthEmergencies;
    final availabilityOfCommunityHealthPrograms =
        state.availabilityOfCommunityHealthPrograms;
    final outreachProgramsForRuralAreas = state.outreachProgramsForRuralAreas;
    final presenceOfHealthEducationPrograms =
        state.presenceOfHealthEducationPrograms;
    final accessibilityOfHealthInformationToThePublic =
        state.accessibilityOfHealthInformationToThePublic;
    final accessibilityOfHealthServicesToDifferentDemographics =
        state.accessibilityOfHealthServicesToDifferentDemographics;
    final governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy =
        state
            .governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy;
    final investmentsAimedatImprovingHealthcareServices =
        state.investmentsAimedatImprovingHealthcareServices;
    final collectionOfPublicHealthData = state.collectionOfPublicHealthData;
    final surveillanceSystemsForMonitoringHealthTrends =
        state.surveillanceSystemsForMonitoringHealthTrends;
    final environmentalHealthManagementFacilities =
        state.environmentalHealthManagementFacilities;
    final doYouHaveAWASHProgram = state.doYouHaveAWASHProgram;
    final doYouHaveAGoodRefuseDisposalSystemIncenerator =
        state.doYouHaveAGoodRefuseDisposalSystemIncenerator;

    final newForm = HealthQuestionnaireModel(
      name: name,
      lga: lga,
      ward: ward,
      gpsLocation: gpsLocation,
      photoOfSignPost: photoOfSignPost,
      typeOfCareCenter: typeOfCareCenter,
      howManyCareCenters: howManyCareCenters,
      whatTypeOfRoad: whatTypeOfRoad,
      howManyAmbulances: howManyAmbulances,
      sourceOfPower: sourceOfPower,
      numberOfSurgeons: numberOfSurgeons,
      numberOfDoctors: numberOfDoctors,
      numberOfNurses: numberOfNurses,
      numberOfNursingAssistants: numberOfNursingAssistants,
      numberOfPharmacists: numberOfPharmacists,
      numberOfLabTechnicians: numberOfLabTechnicians,
      numberOfCleaners: numberOfCleaners,
      numberOfDispensaryAssistant: numberOfDispensaryAssistant,
      numberOfCommunityHealthOfficers: numberOfCommunityHealthOfficers,
      numberOfRecordOfficers: numberOfRecordOfficers,
      measuresInplaceForDiseaseControl: measuresInplaceForDiseaseControl,
      responseMechanismsToHealthEmergencies:
          responseMechanismsToHealthEmergencies,
      availabilityOfCommunityHealthPrograms:
          availabilityOfCommunityHealthPrograms,
      outreachProgramsForRuralAreas: outreachProgramsForRuralAreas,
      presenceOfHealthEducationPrograms: presenceOfHealthEducationPrograms,
      accessibilityOfHealthInformationToThePublic:
          accessibilityOfHealthInformationToThePublic,
      accessibilityOfHealthServicesToDifferentDemographics:
          accessibilityOfHealthServicesToDifferentDemographics,
      governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
          governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,
      investmentsAimedatImprovingHealthcareServices:
          investmentsAimedatImprovingHealthcareServices,
      collectionOfPublicHealthData: collectionOfPublicHealthData,
      surveillanceSystemsForMonitoringHealthTrends:
          surveillanceSystemsForMonitoringHealthTrends,
      environmentalHealthManagementFacilities:
          environmentalHealthManagementFacilities,
      doYouHaveAWASHProgram: doYouHaveAWASHProgram,
      doYouHaveAGoodRefuseDisposalSystemIncenerator:
          doYouHaveAGoodRefuseDisposalSystemIncenerator,
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
      photoOfFront: photoOfFront,
      photoOfSide: photoOfSide,
      photoOfReception: photoOfReception,
    );

    const secureStorage = FlutterSecureStorage();
    final encryptionKey = await secureStorage.read(key: encAuthBoxKey);
    if(encryptionKey == null){
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: encAuthBoxKey,
        value: base64UrlEncode(key),
      );
    }

    final encryptionKeyUint8List = base64Decode(encryptionKey!);
    final encryptedAgroQuestionnaireBox =
        await Hive.openBox<HealthQuestionnaireModel>(
      encHealthFormBox,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    await encryptedAgroQuestionnaireBox.add(newForm);
    await newForm.save();
    pass(noNetworkFormSavedToDevice);
    return true;
  }

  @override
  QuestionnaireState? fromJson(Map<String, dynamic> json) {
    return QuestionnaireState(
      isLoading: json['isLoading'] as bool,
      success: json['success'] as String,
      failure: json['failure'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
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
      methodOfFarming: json['methodOfFarming'] as String,
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

      //--------HEALTH QUESTIONNAIRE-------------//
      gpsLocation: json['gpsLocation'] as String,
      photoOfSignPost: json['photoOfSignPost'] as String,
      photoOfFront: json['photoOfFront'] as String,
      photoOfSide: json['photoOfSide'] as String,
      photoOfReception: json['photoOfReception'] as String,
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

      //-----------HEALTH QUESTIONNAIRE-----------------//
      'gpsLocation': state.gpsLocation,
      'photoOfSignPost': state.photoOfSignPost,
      'photoOfFront': state.photoOfFront,
      'photoOfSide': state.photoOfSide,
      'photoOfReception': state.photoOfReception,
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

  /// HELPER FUNCTION TO CLEAR FORM STATE
  void clearForm() => emit(QuestionnaireState.clearForm());

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
