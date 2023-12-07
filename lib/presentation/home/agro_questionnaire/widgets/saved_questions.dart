import 'package:alpha_system/domain/models/agro/agro_questionnaire_model.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Home page widget.
class SavedAgroFormTabWidget extends StatelessWidget {
  /// constructor
  const SavedAgroFormTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<AgroQuestionnaireModel>(encAgroFromBox).listenable(),
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
                  children: box.values
                      .map((e) {
                        return AgroFormField(
                            name: e.name!,
                            gender: e.gender!,
                            phone: e.phone!,);
                      })
                      .toList()
                      .reversed
                      .toList(),
                ),
              );
      },
    );
  }
}

/// AgroFormField used to deiplay intems in the farm inventory.
/// Take the inventoryname and quantity as parameters
class AgroFormField extends StatelessWidget {
  /// Constructors
  const AgroFormField({
    required this.name,
    required this.gender,
    required this.phone,
    super.key,
  });

  /// Item name
  final String name;

  /// Item gender in Questionnaire model
  final String gender;

  /// Item phone in Questionnaire model
  final String phone;

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
          Column(
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                gender,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            phone,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
