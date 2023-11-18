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
      fields[5] as int?,
      fields[6] as int?,
      fields[7] as String?,
      fields[8] as int?,
      fields[9] as String?,
      fields[10] as int?,
      fields[11] as int?,
      fields[12] as int?,
      fields[13] as int?,
      fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HealthQuestionnaireModel obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.numberOfPharmacists);
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
