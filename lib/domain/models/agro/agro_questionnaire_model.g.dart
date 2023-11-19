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
      name: fields[0] as String?,
      gender: fields[1] as String?,
      age: fields[2] as String?,
      createdAt: fields[26] as DateTime?,
      modifiedAt: fields[27] as DateTime?,
      educationalLevel: fields[3] as String?,
      lga: fields[4] as String?,
      ward: fields[5] as String?,
      village: fields[6] as String?,
      phone: fields[7] as String?,
      yearsOfFarming: fields[8] as int?,
      typeofFarming: fields[9] as String?,
      sizeOfFarm: fields[10] as double?,
      cropsGrown: (fields[11] as List?)?.cast<String>(),
      livestockRaised: (fields[12] as List?)?.cast<String>(),
      methodOfFarming: fields[13] as String?,
      typesOfMachineryNeeded: (fields[14] as List?)?.cast<String>(),
      phoneOfNextOfKin: fields[15] as String?,
      useAgroChemicals: fields[16] as bool?,
      useFertilizer: fields[17] as bool?,
      preferredFertilizers: (fields[18] as List?)?.cast<String>(),
      nin: fields[19] as String?,
      residentialAddress: fields[20] as String?,
      farmAddress: fields[21] as String?,
      bankName: fields[22] as String?,
      accountNumber: fields[23] as String?,
      bvn: fields[24] as String?,
      farmersGroup: fields[25] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AgroQuestionnaireModel obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.educationalLevel)
      ..writeByte(4)
      ..write(obj.lga)
      ..writeByte(5)
      ..write(obj.ward)
      ..writeByte(6)
      ..write(obj.village)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.yearsOfFarming)
      ..writeByte(9)
      ..write(obj.typeofFarming)
      ..writeByte(10)
      ..write(obj.sizeOfFarm)
      ..writeByte(11)
      ..write(obj.cropsGrown)
      ..writeByte(12)
      ..write(obj.livestockRaised)
      ..writeByte(13)
      ..write(obj.methodOfFarming)
      ..writeByte(14)
      ..write(obj.typesOfMachineryNeeded)
      ..writeByte(15)
      ..write(obj.phoneOfNextOfKin)
      ..writeByte(16)
      ..write(obj.useAgroChemicals)
      ..writeByte(17)
      ..write(obj.useFertilizer)
      ..writeByte(18)
      ..write(obj.preferredFertilizers)
      ..writeByte(19)
      ..write(obj.nin)
      ..writeByte(20)
      ..write(obj.residentialAddress)
      ..writeByte(21)
      ..write(obj.farmAddress)
      ..writeByte(22)
      ..write(obj.bankName)
      ..writeByte(23)
      ..write(obj.accountNumber)
      ..writeByte(24)
      ..write(obj.bvn)
      ..writeByte(25)
      ..write(obj.farmersGroup)
      ..writeByte(26)
      ..write(obj.createdAt)
      ..writeByte(27)
      ..write(obj.modifiedAt);
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
