part of 'questionnaire_cubit.dart';

@freezed

/// Authentication cubit state
class QuestionnaireState with _$QuestionnaireState {
  /// Factory constructor for cubit state. Sealed classes with freezed
  const factory QuestionnaireState({
    required bool isLoading,
    required String success,
    required String failure,
    // General Values
    required String name,
    required String lga,
    required String ward,

    ///----------AGRO QUESTIONNAIRE------------///
    required String gender,
    required int age,
    required String educationalLevel,

    //Contact Information
    required String village,
    required String phone,

    //Farmers Profile
    required int yearsOfFarming,
    required String typeofFarming,
    required double sizeOfFarm,
    required List<String> cropsGrown,
    required List<String> livestockRaised,

    //Agricultural Practices
    required List<String> methodOfFarming,
    required List<String> typesOfMachineryNeeded,
    required String phoneOfNextOfKin,
    required bool useAgroChemicals,
    required bool useFertilizer,
    required List<String> preferredFertilizers,

    //Additional Information
    required String nin,
    required String residentialAddress,
    required String farmAddress,
    required String bankName,
    required String accountNumber,
    required String bvn,
    required String farmersGroup,

    ///------------HEALTH QUESTIONNAIRE--------------///

    //Bio - Data
    required String gpsLocation,
    required String photoOfSignPost,
    required String typeOfCareCenter,
    required int howManyCareCenters,
    required String whatTypeOfRoad,
    required int howManyAmbulances,
    required String sourceOfPower,

    //Medical personnel
    required int numberOfSurgeons,
    required int numberOfDoctors,
    required int numberOfNurses,
    required int numberOfNursingAssistants,
    required int numberOfPharmacists,
    required int numberOfLabTechnicians,
    required int numberOfCleaners,
    required int numberOfDispensaryAssistant,
    required int numberOfCommunityHealthOfficers,
    required int numberOfRecordOfficers,

    //Disease Control
    required bool measuresInplaceForDiseaseControl,
    required bool responseMechanismsToHealthEmergencies,

    //Community Health Programs
    required String availabilityOfCommunityHealthPrograms,
    required String outreachProgramsForRuralAreas,

    //Health Education
    required bool presenceOfHealthEducationPrograms,
    required bool accessibilityOfHealthInformationToThePublic,

    //Healthcare Accessiblity
    required String accessibilityOfHealthServicesToDifferentDemographics,

    //Government Initiatives
    required bool
        governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,
    required bool investmentsAimedatImprovingHealthcareServices,

    //Public Health Data
    required String collectionOfPublicHealthData,
    required String surveillanceSystemsForMonitoringHealthTrends,
    required String environmentalHealthManagementFacilities,
    required bool doYouHaveAWASHProgram,
    required bool doYouHaveAGoodRefuseDisposalSystemIncenerator,
  }) = _QuestionnaireState;

  /// empty factory state
  factory QuestionnaireState.empty() => QuestionnaireState(
        isLoading: false,
        success: '',
        failure: '',
        name: '',
        gender: '',
        age: 0,
        educationalLevel: '',
        lga: '',
        ward: '',
        village: '',
        phone: '',
        yearsOfFarming: 0,
        typeofFarming: '',
        sizeOfFarm: 0,
        cropsGrown: [],
        livestockRaised: [],
        methodOfFarming: [],
        typesOfMachineryNeeded: [],
        phoneOfNextOfKin: '',
        useAgroChemicals: false,
        useFertilizer: false,
        preferredFertilizers: [],
        nin: '',
        residentialAddress: '',
        farmAddress: '',
        bankName: '',
        accountNumber: '',
        bvn: '',
        farmersGroup: '',
        gpsLocation: '',
        photoOfSignPost: '',
        typeOfCareCenter: '',
        howManyCareCenters: 0,
        whatTypeOfRoad: '',
        howManyAmbulances: 0,
        sourceOfPower: '',
        numberOfSurgeons: 0,
        numberOfDoctors: 0,
        numberOfNurses: 0,
        numberOfNursingAssistants: 0,
        numberOfPharmacists: 0,
        numberOfLabTechnicians: 0,
        numberOfCleaners: 0,
        numberOfDispensaryAssistant: 0,
        numberOfCommunityHealthOfficers: 0,
        numberOfRecordOfficers: 0,
        measuresInplaceForDiseaseControl: false,
        responseMechanismsToHealthEmergencies: false,
        availabilityOfCommunityHealthPrograms: '',
        outreachProgramsForRuralAreas: '',
        presenceOfHealthEducationPrograms: false,
        accessibilityOfHealthInformationToThePublic: false,
        accessibilityOfHealthServicesToDifferentDemographics: '',
        governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
            false,
        investmentsAimedatImprovingHealthcareServices: false,
        collectionOfPublicHealthData: '',
        surveillanceSystemsForMonitoringHealthTrends: '',
        environmentalHealthManagementFacilities: '',
        doYouHaveAWASHProgram: false,
        doYouHaveAGoodRefuseDisposalSystemIncenerator: false,
      );
}
