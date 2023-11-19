import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'agro_questionnaire_model.g.dart';

@HiveType(typeId: 0)

/// UserModel class. Extends a Hiveobject to supercharge storing to local storage.
class AgroQuestionnaireModel extends HiveObject {
  /// Constructor
  AgroQuestionnaireModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.educationalLevel,
    required this.lga,
    required this.ward,
    required this.village,
    required this.phone,
    required this.yearsOfFarming,
    required this.typeofFarming,
    required this.sizeOfFarm,
    required this.cropsGrown,
    required this.livestockRaised,
    required this.methodOfFarming,
    required this.typesOfMachineryNeeded,
    required this.phoneOfNextOfKin,
    required this.useAgroChemicals,
    required this.useFertilizer,
    required this.preferredFertilizers,
    required this.nin,
    required this.residentialAddress,
    required this.farmAddress,
    required this.bankName,
    required this.accountNumber,
    required this.bvn,
    required this.farmersGroup,
  });

  /// class constructor

  //Bio-Data
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? gender;
  @HiveField(2)
  int? age;
  @HiveField(3)
  String? educationalLevel;

  //Contact Information
  @HiveField(4)
  String? lga;
  @HiveField(5)
  String? ward;
  @HiveField(6)
  String? village;
  @HiveField(7)
  String? phone;

  //Farmers Profile
  @HiveField(8)
  int? yearsOfFarming;
  @HiveField(9)
  String? typeofFarming;
  @HiveField(10)
  double? sizeOfFarm;
  @HiveField(11)
  List<String>? cropsGrown;
  @HiveField(12)
  List<String>? livestockRaised;

  //Agricultural Practices
  @HiveField(13)
  List<String>? methodOfFarming;
  @HiveField(14)
  List<String>? typesOfMachineryNeeded;
  @HiveField(15)
  String? phoneOfNextOfKin;
  @HiveField(16)
  bool? useAgroChemicals;
  @HiveField(17)
  bool? useFertilizer;
  @HiveField(18)
  List<String>? preferredFertilizers;

  //Additional Information
  @HiveField(19)
  String? nin;
  @HiveField(20)
  String? residentialAddress;
  @HiveField(21)
  String? farmAddress;
  @HiveField(22)
  String? bankName;
  @HiveField(23)
  String? accountNumber;
  @HiveField(24)
  String? bvn;
  @HiveField(25)
  String? farmersGroup;
}
