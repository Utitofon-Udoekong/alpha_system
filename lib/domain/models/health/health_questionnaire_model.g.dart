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
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as int?,
      fields[7] as String?,
      fields[8] as int?,
      fields[9] as String?,
      fields[10] as int?,
      fields[11] as int?,
      fields[12] as int?,
      fields[13] as int?,
      fields[14] as int?,
      fields[15] as int?,
      fields[16] as int?,
      fields[17] as int?,
      fields[18] as int?,
      fields[19] as int?,
      fields[20] as bool?,
      fields[21] as bool?,
      fields[22] as String?,
      fields[23] as String?,
      fields[24] as bool?,
      fields[25] as bool?,
      fields[26] as String?,
      fields[27] as bool?,
      fields[28] as bool?,
      fields[29] as String?,
      fields[30] as String?,
      fields[31] as String?,
      fields[32] as bool?,
      fields[33] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HealthQuestionnaireModel obj) {
    writer
      ..writeByte(34)
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
      ..write(obj.typeOfCareCenter)
      ..writeByte(6)
      ..write(obj.howManyCareCenters)
      ..writeByte(7)
      ..write(obj.whatTypeOfRoad)
      ..writeByte(8)
      ..write(obj.howManyAmbulances)
      ..writeByte(9)
      ..write(obj.sourceOfPower)
      ..writeByte(10)
      ..write(obj.numberOfSurgeons)
      ..writeByte(11)
      ..write(obj.numberOfDoctors)
      ..writeByte(12)
      ..write(obj.numberOfNurses)
      ..writeByte(13)
      ..write(obj.numberOfNursingAssistants)
      ..writeByte(14)
      ..write(obj.numberOfPharmacists)
      ..writeByte(15)
      ..write(obj.numberOfLabTechnicians)
      ..writeByte(16)
      ..write(obj.numberOfCleaners)
      ..writeByte(17)
      ..write(obj.numberOfDispensaryAssistant)
      ..writeByte(18)
      ..write(obj.numberOfCommunityHealthOfficers)
      ..writeByte(19)
      ..write(obj.numberOfRecordOfficers)
      ..writeByte(20)
      ..write(obj.measuresInplaceForDiseaseControl)
      ..writeByte(21)
      ..write(obj.responseMechanismsToHealthEmergencies)
      ..writeByte(22)
      ..write(obj.availabilityOfCommunityHealthPrograms)
      ..writeByte(23)
      ..write(obj.outreachProgramsForRuralAreas)
      ..writeByte(24)
      ..write(obj.presenceOfHealthEducationPrograms)
      ..writeByte(25)
      ..write(obj.accessibilityOfHealthInformationToThePublic)
      ..writeByte(26)
      ..write(obj.accessibilityOfHealthServicesToDifferentDemographics)
      ..writeByte(27)
      ..write(obj
          .governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy)
      ..writeByte(28)
      ..write(obj.investmentsAimedatImprovingHealthcareServices)
      ..writeByte(29)
      ..write(obj.collectionOfPublicHealthData)
      ..writeByte(30)
      ..write(obj.surveillanceSystemsForMonitoringHealthTrends)
      ..writeByte(31)
      ..write(obj.environmentalHealthManagementFacilities)
      ..writeByte(32)
      ..write(obj.doYouHaveAWASHProgram)
      ..writeByte(33)
      ..write(obj.doYouHaveAGoodRefuseDisposalSystemIncenerator);
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
