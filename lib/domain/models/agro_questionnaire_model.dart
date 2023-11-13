import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'agro_questionnaire_model.g.dart';

@HiveType(typeId: 0)

/// UserModel class. Extends a Hiveobject to supercharge storing to local storage.
class AgroQuestionnaireModel extends HiveObject {
  /// class constructor
  AgroQuestionnaireModel(
      {required this.surname,
      required this.otherNames,
      required this.age,
      required this.gender,
      required this.maritalStatus,
      required this.numberOfSpouses,
      required this.numberOfChildren,
      required this.nextOfKin,
      required this.contactNumber,
      required this.altContactNumber,
      required this.phoneOfNextOfKin,
      this.userLGA,
      this.userWard,
      this.userCommunity,
      this.isYourFarmInTheSameVillageAsYourAddress});

  @HiveField(0)
  final String surname;
  @HiveField(1)
  final String otherNames;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final Gender gender;
  @HiveField(4)
  final MaritalStatus maritalStatus;
  @HiveField(5)
  final int numberOfSpouses;
  @HiveField(6)
  final int numberOfChildren;
  @HiveField(7)
  final String nextOfKin;
  @HiveField(8)
  final String contactNumber;
  @HiveField(9)
  final String altContactNumber;
  @HiveField(10)
  final String phoneOfNextOfKin;
  @HiveField(11)
  String? userLGA;
  @HiveField(12)
  String? userWard;
  @HiveField(13)
  String? userCommunity;
  @HiveField(14)
  bool? isYourFarmInTheSameVillageAsYourAddress;
}
// @HiveField(4)
// final String farmLGA;
// @HiveField(4)
// final String farmWard;
// @HiveField(4)
// final String farmCommunity;
// @HiveField(4)
// final String closestLandmark;
// @HiveField(4)
// final Map<String,String> geoCoordinates;
// @HiveField(4)
// final String ownershipStatus;
// @HiveField(4)
// final String tenure;
// @HiveField(4)
// final String whatDoYouProduce;
// @HiveField(4)
// final String sizeOfHarvest;
// @HiveField(4)
// final SaleMethod howDoYouSellProduce;
// @HiveField(4)
// final String inputs;
// @HiveField(4)
// final String bvn;
// @HiveField(4)
// final String accountNo;
// @HiveField(4)
// final String bankName;
// @HiveField(4)
// final String date;
// @HiveField(4)
// final String date;

@HiveType(typeId: 2)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
}

@HiveType(typeId: 3)
enum MaritalStatus {
  @HiveField(0)
  Single,
  @HiveField(1)
  Married,
}
// @HiveType(typeId: 3)
// enum SaleMethod{
//   openMarket, supply
// }