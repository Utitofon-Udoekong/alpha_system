// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 11;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(0);
        break;
      case Gender.female:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaritalStatusAdapter extends TypeAdapter<MaritalStatus> {
  @override
  final int typeId = 12;

  @override
  MaritalStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MaritalStatus.Single;
      case 1:
        return MaritalStatus.Married;
      default:
        return MaritalStatus.Single;
    }
  }

  @override
  void write(BinaryWriter writer, MaritalStatus obj) {
    switch (obj) {
      case MaritalStatus.Single:
        writer.writeByte(0);
        break;
      case MaritalStatus.Married:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaritalStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
