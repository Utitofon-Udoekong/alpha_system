// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agro_questionnaire_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgroQuestionnaireModelAdapter
    extends TypeAdapter<AgroQuestionnaireModel> {
  @override
  final int typeId = 0;

  @override
  AgroQuestionnaireModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AgroQuestionnaireModel(
      surname: fields[0] as String,
      otherNames: fields[1] as String,
      age: fields[2] as int,
      gender: fields[3] as Gender,
      maritalStatus: fields[4] as MaritalStatus,
      numberOfSpouses: fields[5] as int,
      numberOfChildren: fields[6] as int,
      nextOfKin: fields[7] as String,
      contactNumber: fields[8] as String,
      altContactNumber: fields[9] as String,
      phoneOfNextOfKin: fields[10] as String,
      userLGA: fields[11] as String?,
      userWard: fields[12] as String?,
      userCommunity: fields[13] as String?,
      isYourFarmInTheSameVillageAsYourAddress: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AgroQuestionnaireModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.surname)
      ..writeByte(1)
      ..write(obj.otherNames)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.maritalStatus)
      ..writeByte(5)
      ..write(obj.numberOfSpouses)
      ..writeByte(6)
      ..write(obj.numberOfChildren)
      ..writeByte(7)
      ..write(obj.nextOfKin)
      ..writeByte(8)
      ..write(obj.contactNumber)
      ..writeByte(9)
      ..write(obj.altContactNumber)
      ..writeByte(10)
      ..write(obj.phoneOfNextOfKin)
      ..writeByte(11)
      ..write(obj.userLGA)
      ..writeByte(12)
      ..write(obj.userWard)
      ..writeByte(13)
      ..write(obj.userCommunity)
      ..writeByte(14)
      ..write(obj.isYourFarmInTheSameVillageAsYourAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgroQuestionnaireModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
