import 'package:alpha_system/domain/models/user_model.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Inventory tab widget
class ProfileTabWidget extends StatelessWidget {
  ///constructor
  const ProfileTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userbox = Hive.box<UserModel>(userModelBox);
    final userModel = userbox.getAt(0)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Surname',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.surname),
          Text(
            'Other names',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.otherNames),
          Text(
            'Age',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.age),
          Text(
            'Gender',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.gender.name),
          Text(
            'Contact number',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.contactNumber),
          Text(
            'Marital status',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.maritalStatus.name),
          Text(
            'Number of spouses',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.numberOfSpouses),
          Text(
            'Number of children',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.numberOfChildren),
          Text(
            'Alternate contact number',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.altContactNumber),
          Text(
            'Next of kin',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.nextOfKin),
          Text(
            'Next of kin contact',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          MText(title: userModel.phoneOfNextOfKin),
        ],
      ),
    );
  }
}

/// Text helper class for profile widget
class MText extends StatelessWidget {
  /// constructor
  const MText({required this.title, super.key});

  /// text passed
  final dynamic title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
