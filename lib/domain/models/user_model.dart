import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)

/// Usermodel Objects. Extends a Hiveobject to supercharge storing to local storage.
class Usermodel extends HiveObject {
  /// class constructor
  Usermodel(
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
      required this.userLGA,
      required this.userWard,
      required this.userCommunity,
      required this.isYourFarmInTheSameVillageAsYourAddress});

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
  final String userLGA;
  @HiveField(12)
  final String userWard;
  @HiveField(13)
  final String userCommunity;
  @HiveField(14)
  final bool isYourFarmInTheSameVillageAsYourAddress;
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

// @HiveType(typeId: 1)
enum Gender { male, female }

// @HiveType(typeId: 2)
enum MaritalStatus { single, married }
// @HiveType(typeId: 3)
// enum SaleMethod{
//   openMarket, supply
// }