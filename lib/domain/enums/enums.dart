import 'package:hive_flutter/adapters.dart';
part 'enums.g.dart';

@HiveType(typeId: 11)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
}

@HiveType(typeId: 12)
enum MaritalStatus {
  @HiveField(0)
  Single,
  @HiveField(1)
  Married,
}
