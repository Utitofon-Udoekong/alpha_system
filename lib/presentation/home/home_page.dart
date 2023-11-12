import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/presentation/authentication/cubit/auth_cubit.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:alpha_system/presentation/home/cubit/inventory_cubit.dart';
import 'package:alpha_system/presentation/home/widgets/home_widget.dart';
import 'package:alpha_system/presentation/home/widgets/inventory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Home page
class HomePage extends StatelessWidget {
  /// Home page constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Alpha Farm Inventory',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final dialog = ActionDialog(
                  title: "You're about to clear your inventory",
                  dialogAction: () async {
                    final inventoryBox = Hive.box<FarmList>(farmInventoryBox);
                    context.pop();
                    await inventoryBox.clear();
                  },
                );
                await showDialog(
                  context: context,
                  builder: (context) {
                    return dialog;
                  },
                );
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () async {
                final dialog = ActionDialog(
                  title: "You're about to logout",
                  dialogAction: () {
                    while (context.canPop() == true) {
                      context.pop();
                    }
                    context.read<AuthCubit>().reset();
                    context.read<InventoryCubit>().reset();
                    context.pushReplacement('/login');
                  },
                );
                await showDialog(
                  context: context,
                  builder: (context) {
                    return dialog;
                  },
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Farm Inventory'),
              Tab(text: 'Add Item'),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: TabBarView(
            children: <Widget>[
              HomePageTabWidget(),
              InventoryTabWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

///Custom dialog
class ActionDialog extends StatelessWidget {
  ///constructor
  const ActionDialog({
    required this.title,
    super.key,
    this.dialogAction,
  });

  /// Dialog Title
  final String title;

  ///Dialog action
  final void Function()? dialogAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: [
        Row(
          children: [
            InkWell(
              onTap: dialogAction,
              child: Container(
                alignment: Alignment.center,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
                child: Text(
                  'Continue',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => context.pop(),
              child: Container(
                alignment: Alignment.center,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(30),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
