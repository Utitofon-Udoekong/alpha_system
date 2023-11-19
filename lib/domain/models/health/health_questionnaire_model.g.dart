// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_questionnaire_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthQuestionnaireModelAdapter
    extends TypeAdapter<HealthQuestionnaireModel> {
  @override
  final int typeId = 1;

  @override
  HealthQuestionnaireModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthQuestionnaireModel(
      name: fields[0] as String?,
      createdAt: fields[37] as DateTime?,
      modifiedAt: fields[38] as DateTime?,
      lga: fields[1] as String?,
      ward: fields[2] as String?,
      gpsLocation: fields[3] as String?,
      photoOfSignPost: fields[4] as String?,
      photoOfFront: fields[5] as String?,
      photoOfSide: fields[6] as String?,
      photoOfReception: fields[7] as String?,
      typeOfCareCenter: fields[8] as String?,
      howManyCareCenters: fields[9] as int?,
      whatTypeOfRoad: fields[10] as String?,
      howManyAmbulances: fields[11] as int?,
      sourceOfPower: fields[12] as String?,
      numberOfSurgeons: fields[13] as int?,
      numberOfDoctors: fields[14] as int?,
      numberOfNurses: fields[15] as int?,
      numberOfNursingAssistants: fields[16] as int?,
      numberOfPharmacists: fields[17] as int?,
      numberOfLabTechnicians: fields[18] as int?,
      numberOfCleaners: fields[19] as int?,
      numberOfDispensaryAssistant: fields[20] as int?,
      numberOfCommunityHealthOfficers: fields[21] as int?,
      numberOfRecordOfficers: fields[22] as int?,
      measuresInplaceForDiseaseControl: fields[23] as bool?,
      responseMechanismsToHealthEmergencies: fields[24] as bool?,
      availabilityOfCommunityHealthPrograms: fields[25] as String?,
      outreachProgramsForRuralAreas: fields[26] as String?,
      presenceOfHealthEducationPrograms: fields[27] as bool?,
      accessibilityOfHealthInformationToThePublic: fields[28] as bool?,
      accessibilityOfHealthServicesToDifferentDemographics:
          fields[29] as String?,
      governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy:
          fields[30] as bool?,
      investmentsAimedatImprovingHealthcareServices: fields[31] as bool?,
      collectionOfPublicHealthData: fields[32] as String?,
      surveillanceSystemsForMonitoringHealthTrends: fields[33] as String?,
      environmentalHealthManagementFacilities: fields[34] as String?,
      doYouHaveAWASHProgram: fields[35] as bool?,
      doYouHaveAGoodRefuseDisposalSystemIncenerator: fields[36] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HealthQuestionnaireModel obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lga)
      ..writeByte(2)
      ..write(obj.ward)
      ..writeByte(3)
      ..write(obj.gpsLocation)
      ..writeByte(4)
      ..write(obj.photoOfSignPost)
      ..writeByte(5)
      ..write(obj.photoOfFront)
      ..writeByte(6)
      ..write(obj.photoOfSide)
      ..writeByte(7)
      ..write(obj.photoOfReception)
      ..writeByte(8)
      ..write(obj.typeOfCareCenter)
      ..writeByte(9)
      ..write(obj.howManyCareCenters)
      ..writeByte(10)
      ..write(obj.whatTypeOfRoad)
      ..writeByte(11)
      ..write(obj.howManyAmbulances)
      ..writeByte(12)
      ..write(obj.sourceOfPower)
      ..writeByte(13)
      ..write(obj.numberOfSurgeons)
      ..writeByte(14)
      ..write(obj.numberOfDoctors)
      ..writeByte(15)
      ..write(obj.numberOfNurses)
      ..writeByte(16)
      ..write(obj.numberOfNursingAssistants)
      ..writeByte(17)
      ..write(obj.numberOfPharmacists)
      ..writeByte(18)
      ..write(obj.numberOfLabTechnicians)
      ..writeByte(19)
      ..write(obj.numberOfCleaners)
      ..writeByte(20)
      ..write(obj.numberOfDispensaryAssistant)
      ..writeByte(21)
      ..write(obj.numberOfCommunityHealthOfficers)
      ..writeByte(22)
      ..write(obj.numberOfRecordOfficers)
      ..writeByte(23)
      ..write(obj.measuresInplaceForDiseaseControl)
      ..writeByte(24)
      ..write(obj.responseMechanismsToHealthEmergencies)
      ..writeByte(25)
      ..write(obj.availabilityOfCommunityHealthPrograms)
      ..writeByte(26)
      ..write(obj.outreachProgramsForRuralAreas)
      ..writeByte(27)
      ..write(obj.presenceOfHealthEducationPrograms)
      ..writeByte(28)
      ..write(obj.accessibilityOfHealthInformationToThePublic)
      ..writeByte(29)
      ..write(obj.accessibilityOfHealthServicesToDifferentDemographics)
      ..writeByte(30)
      ..write(obj
          .governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy)
      ..writeByte(31)
      ..write(obj.investmentsAimedatImprovingHealthcareServices)
      ..writeByte(32)
      ..write(obj.collectionOfPublicHealthData)
      ..writeByte(33)
      ..write(obj.surveillanceSystemsForMonitoringHealthTrends)
      ..writeByte(34)
      ..write(obj.environmentalHealthManagementFacilities)
      ..writeByte(35)
      ..write(obj.doYouHaveAWASHProgram)
      ..writeByte(36)
      ..write(obj.doYouHaveAGoodRefuseDisposalSystemIncenerator)
      ..writeByte(37)
      ..write(obj.createdAt)
      ..writeByte(38)
      ..write(obj.modifiedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthQuestionnaireModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
