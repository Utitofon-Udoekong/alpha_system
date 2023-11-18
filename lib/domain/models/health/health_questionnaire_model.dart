import 'package:hive_flutter/hive_flutter.dart';
part 'health_questionnaire_model.g.dart';

@HiveType(typeId: 1)
class HealthQuestionnaireModel extends HiveObject {
  HealthQuestionnaireModel(this.name, this.lga, this.ward, this.gpsLocation, this.photoOfSignPost, this.typeOfCareCenter, this.howManyCareCenters, this.whatTypeOfRoad, this.howManyAmbulances, this.sourceOfPower, this.numberOfSurgeons, this.numberOfDoctors, this.numberOfNurses, this.numberOfNursingAssistants, this.numberOfPharmacists, this.numberOfLabTechnicians, this.numberOfCleaners, this.numberOfDispensaryAssistant, this.numberOfCommunityHealthOfficers, this.numberOfRecordOfficers, this.measuresInplaceForDiseaseControl, this.responseMechanismsToHealthEmergencies, this.availabilityOfCommunityHealthPrograms, this.outreachProgramsForRuralAreas, this.presenceOfHealthEducationPrograms, this.accessibilityOfHealthInformationToThePublic, this.accessibilityOfHealthServicesToDifferentDemographics, this.governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy, this.investmentsAimedatImprovingHealthcareServices, this.collectionOfPublicHealthData, this.SurveillanceSystemsForMonitoringHealthTrends, this.environmentalHealthManagementFacilities, this.doYouHaveAWASHProgram, this.doYouHaveAGoodRefuseDisposalSystemIncenerator);

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? lga;
  @HiveField(2)
  int? ward;
  @HiveField(3)
  String? gpsLocation;
  @HiveField(4)
  String? photoOfSignPost;
  @HiveField(5)
  int? typeOfCareCenter;
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
  String? measuresInplaceForDiseaseControl;
  @HiveField(21)
  String? responseMechanismsToHealthEmergencies;
  //Community Health Programs
  @HiveField(22)
  String? availabilityOfCommunityHealthPrograms;
  @HiveField(23)
  String? outreachProgramsForRuralAreas;
  //Health Education
  @HiveField(24)
  String? presenceOfHealthEducationPrograms;
  @HiveField(25)
  String? accessibilityOfHealthInformationToThePublic;
  //Healthcare Accessiblity
  @HiveField(26)
  String? accessibilityOfHealthServicesToDifferentDemographics;
  //Government Initiatives
  @HiveField(27)
  String? governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy;
  @HiveField(28)
  String? investmentsAimedatImprovingHealthcareServices;
  //Public Health Data
  @HiveField(29)
  String? collectionOfPublicHealthData;
  @HiveField(30)
  String? SurveillanceSystemsForMonitoringHealthTrends;
  @HiveField(31)
  String? environmentalHealthManagementFacilities;
  @HiveField(32)
  bool? doYouHaveAWASHProgram;
  @HiveField(33)
  bool? doYouHaveAGoodRefuseDisposalSystemIncenerator;
}
