import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Home page widget.
class HomePageTabWidget extends StatelessWidget {
  /// constructor
  const HomePageTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<FarmList>(farmInventoryBox).listenable(),
      builder: (context, box, widget) {
        return box.isEmpty
            ? const Center(
                child: Column(
                  children: [
                    Text('No Item in inventory'),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: box.values.map((e) {
                    return InventoryField(
                        itemName: e.itemName, quantity: e.quantity);
                  }).toList(),
                ),
              );
      },
    );
  }
}

/// InventoryField used to deiplay intems in the farm inventory.
/// Take the inventoryname and quantity as parameters
class InventoryField extends StatelessWidget {
  /// Constructors
  const InventoryField({
    required this.itemName,
    required this.quantity,
    super.key,
  });

  /// Item name
  final String itemName;

  /// Item quantity in inventory
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(43, 198, 215, 247),
        border: Border.all(
          color: const Color.fromARGB(139, 68, 137, 255),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '$quantity',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
