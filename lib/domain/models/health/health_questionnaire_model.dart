import 'package:hive_flutter/hive_flutter.dart';
part 'health_questionnaire_model.g.dart';

@HiveType(typeId: 1)

///HealthQuestionnaireModel
class HealthQuestionnaireModel extends HiveObject {
  ///Constructor
  HealthQuestionnaireModel(
      {required this.name,
      required this.createdAt, 
      required this.modifiedAt, 
      required this.lga,
      required this.ward,
      required this.gpsLocation,
      required this.photoOfSignPost,
      required this.photoOfFront,
      required this.photoOfSide,
      required this.photoOfReception,
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
      required this.doYouHaveAGoodRefuseDisposalSystemIncenerator,
      });

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
  String? photoOfFront;
  @HiveField(6)
  String? photoOfSide;
  @HiveField(7)
  String? photoOfReception;
  @HiveField(8)
  String? typeOfCareCenter;
  @HiveField(9)
  int? howManyCareCenters;
  @HiveField(10)
  String? whatTypeOfRoad;
  @HiveField(11)
  int? howManyAmbulances;
  @HiveField(12)
  String? sourceOfPower;

  //Medical personnel
  @HiveField(13)
  int? numberOfSurgeons;
  @HiveField(14)
  int? numberOfDoctors;
  @HiveField(15)
  int? numberOfNurses;
  @HiveField(16)
  int? numberOfNursingAssistants;
  @HiveField(17)
  int? numberOfPharmacists;
  @HiveField(18)
  int? numberOfLabTechnicians;
  @HiveField(19)
  int? numberOfCleaners;
  @HiveField(20)
  int? numberOfDispensaryAssistant;
  @HiveField(21)
  int? numberOfCommunityHealthOfficers;
  @HiveField(22)
  int? numberOfRecordOfficers;
  
  //Disease Control
  @HiveField(23)
  bool? measuresInplaceForDiseaseControl;
  @HiveField(24)
  bool? responseMechanismsToHealthEmergencies;

  //Community Health Programs
  @HiveField(25)
  String? availabilityOfCommunityHealthPrograms;
  @HiveField(26)
  String? outreachProgramsForRuralAreas;

  //Health Education
  @HiveField(27)
  bool? presenceOfHealthEducationPrograms;
  @HiveField(28)
  bool? accessibilityOfHealthInformationToThePublic;

  //Healthcare Accessiblity
  @HiveField(29)
  String? accessibilityOfHealthServicesToDifferentDemographics;
  
  //Government Initiatives
  @HiveField(30)
  bool? governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy;
  @HiveField(31)
  bool? investmentsAimedatImprovingHealthcareServices;


  //Public Health Data
  @HiveField(32)
  String? collectionOfPublicHealthData;
  @HiveField(33)
  String? surveillanceSystemsForMonitoringHealthTrends;
  @HiveField(34)
  String? environmentalHealthManagementFacilities;
  @HiveField(35)
  bool? doYouHaveAWASHProgram;
  @HiveField(36)
  bool? doYouHaveAGoodRefuseDisposalSystemIncenerator;
  @HiveField(37)
  DateTime? createdAt;
  @HiveField(38)
  DateTime? modifiedAt;
}
