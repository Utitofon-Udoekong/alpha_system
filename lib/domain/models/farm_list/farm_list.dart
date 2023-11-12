import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'farm_list.g.dart';

@HiveType(typeId: 1)

/// FarmList Objects. Extends a Hiveobject to supercharge storing to local storage.
class FarmList extends HiveObject {
  /// class constructor
  FarmList(
      {required this.itemName,
      required this.quantity,
     });

  @HiveField(0)
  final String itemName;
  @HiveField(1)
  final int quantity;
}
