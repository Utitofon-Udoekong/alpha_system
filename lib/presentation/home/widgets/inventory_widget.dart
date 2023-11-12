import 'package:alpha_system/presentation/home/cubit/inventory_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Inventory tab widget
class InventoryTabWidget extends StatelessWidget {
  ///constructor
  const InventoryTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final itemQuantity =
        context.select((InventoryCubit bloc) => bloc.state.newItemQuantity);
    final isLoading =
        context.select((InventoryCubit bloc) => bloc.state.isLoading);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()  
                ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    title: 'Enter Item Name',
                    obscureText: false,
                    onChanged: (newItemName) =>
                        context.read<InventoryCubit>().setItemName(newItemName),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemQuantityWidget(
                    itemQuantity: itemQuantity,
                    increment: () => context.read<InventoryCubit>().increment(),
                    decrement: () => context.read<InventoryCubit>().decrement(),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            title: 'Save Item',
            onTap: () => context.read<InventoryCubit>().saveNewItem(),
            disabled: isLoading,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

/// Handles the change of item quantity
class ItemQuantityWidget extends StatelessWidget {
  ///constructor
  const ItemQuantityWidget({
    required this.itemQuantity,
    required this.increment,
    required this.decrement,
    super.key,
  });

  /// Item quantity
  final int itemQuantity;

  /// Increments the item quantity
  final void Function() increment;

  /// Decrements the item quantity
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Quantity'),
              TextSpan(
                text: ' $itemQuantity',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increment,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decrement,
            ),
          ],
        ),
      ],
    );
  }
}
