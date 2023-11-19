import 'package:hive_flutter/hive_flutter.dart';
part 'health_questionnaire_model.g.dart';

@HiveType(typeId: 1)

///HealthQuestionnaireModel
class HealthQuestionnaireModel extends HiveObject {
  ///Constructor
  HealthQuestionnaireModel(
      {required this.name,
      required this.lga,
      required this.ward,
      required this.gpsLocation,
      required this.photoOfSignPost,
      required this.typeOfCareCenter,
      required this.howManyCareCenters,
      required this.whatTypeOfRoad,
      required this.howManyAmbulances,
      required this.sourceOfPower,
      required this.numberOfSurgeons,
      required this.numberOfDoctors,
      required this.numberOfNurses,
      required this.numberOfNursingAssistants,
      required this.numberOfPharmacists,
      required this.numberOfLabTechnicians,
      required this.numberOfCleaners,
      required this.numberOfDispensaryAssistant,
      required this.numberOfCommunityHealthOfficers,
      required this.numberOfRecordOfficers,
      required this.measuresInplaceForDiseaseControl,
      required this.responseMechanismsToHealthEmergencies,
      required this.availabilityOfCommunityHealthPrograms,
      required this.outreachProgramsForRuralAreas,
      required this.presenceOfHealthEducationPrograms,
      required this.accessibilityOfHealthInformationToThePublic,
      required this.accessibilityOfHealthServicesToDifferentDemographics,
      required this.governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,
      required this.investmentsAimedatImprovingHealthcareServices,
      required this.collectionOfPublicHealthData,
      required this.surveillanceSystemsForMonitoringHealthTrends,
      required this.environmentalHealthManagementFacilities,
      required this.doYouHaveAWASHProgram,
      required this.doYouHaveAGoodRefuseDisposalSystemIncenerator});

  //Bio - Data
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? lga;
  @HiveField(2)
  String? ward;
  @HiveField(3)
  String? gpsLocation;
  @HiveField(4)
  String? photoOfSignPost;
  @HiveField(5)
  String? typeOfCareCenter;
  @HiveField(6)
  int? howManyCareCenters;
  @HiveField(7)
  String? whatTypeOfRoad;
  @HiveField(8)
  int? howManyAmbulances;
  @HiveField(9)
  String? sourceOfPower;

  //Medical personnel
  @HiveField(10)
  int? numberOfSurgeons;
  @HiveField(11)
  int? numberOfDoctors;
  @HiveField(12)
  int? numberOfNurses;
  @HiveField(13)
  int? numberOfNursingAssistants;
  @HiveField(14)
  int? numberOfPharmacists;
  @HiveField(15)
  int? numberOfLabTechnicians;
  @HiveField(16)
  int? numberOfCleaners;
  @HiveField(17)
  int? numberOfDispensaryAssistant;
  @HiveField(18)
  int? numberOfCommunityHealthOfficers;
  @HiveField(19)
  int? numberOfRecordOfficers;

  //Disease Control
  @HiveField(20)
  bool? measuresInplaceForDiseaseControl;
  @HiveField(21)
  bool? responseMechanismsToHealthEmergencies;

  //Community Health Programs
  @HiveField(22)
  String? availabilityOfCommunityHealthPrograms;
  @HiveField(23)
  String? outreachProgramsForRuralAreas;

  //Health Education
  @HiveField(24)
  bool? presenceOfHealthEducationPrograms;
  @HiveField(25)
  bool? accessibilityOfHealthInformationToThePublic;

  //Healthcare Accessiblity
  @HiveField(26)
  String? accessibilityOfHealthServicesToDifferentDemographics;

  //Government Initiatives
  @HiveField(27)
  bool? governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy;
  @HiveField(28)
  bool? investmentsAimedatImprovingHealthcareServices;

  //Public Health Data
  @HiveField(29)
  String? collectionOfPublicHealthData;
  @HiveField(30)
  String? surveillanceSystemsForMonitoringHealthTrends;
  @HiveField(31)
  String? environmentalHealthManagementFacilities;
  @HiveField(32)
  bool? doYouHaveAWASHProgram;
  @HiveField(33)
  bool? doYouHaveAGoodRefuseDisposalSystemIncenerator;
}
