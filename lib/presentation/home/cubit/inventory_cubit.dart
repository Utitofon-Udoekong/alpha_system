import 'package:alpha_system/domain/models/farm_list/farm_list.dart';
import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'inventory_state.dart';
part 'inventory_cubit.freezed.dart';

@lazySingleton

/// Inventory cubit
class InventoryCubit extends HydratedCubit<InventoryState> {
  ///constructor
  InventoryCubit() : super(InventoryState.empty());

  /// HELPER FUNCTION TO INCREMENT ITEM QUANTITY
  void decrement() {
    final quantity = state.newItemQuantity;
    if (quantity == 1){
      return;
    }
    emit(state.copyWith(newItemQuantity: state.newItemQuantity - 1));
  }

  /// HELPER FUNCTION TO DECREMENT ITEM QUANTITY
  void increment() =>
      emit(state.copyWith(newItemQuantity: state.newItemQuantity + 1));

  /// SETS ITEM NAME
  void setItemName(String newItemName) =>
      emit(state.copyWith(newItemName: newItemName));
  
  /// SAVE NEW ITEM TO THE INVENTORY
  Future<void> saveNewItem()async{
    load();
    final itemName = state.newItemName;
    final itemQuantity = state.newItemQuantity;

    if(itemName.isEmpty){
      fail('Provide a name for the item');
      return;
    }

    final box = Hive.box<FarmList>(farmInventoryBox);
    final newItem = FarmList(itemName: itemName, quantity: itemQuantity);
    await box.add(newItem);
    await newItem.save();
    pass('Item saved');
    reset();
  }

  /// HELPER FUNCTION TO SAVE SUCCESS STATES
  void pass(String success) =>
      emit(state.copyWith(success: success, isLoading: false));

  /// HELPER FUNCTION TO SAVE FAILURE STATES
  void fail(String failure) =>
      emit(state.copyWith(failure: failure, isLoading: false));

  /// HELPER FUNCTION TO SET LOADING STATE
  void load() =>
      emit(state.copyWith(success: '', failure: '', isLoading: true));

  /// HELPER FUNCTION TO RESET LOADING STATE
  void reset() => emit(state.copyWith(
        newItemName: '',
        newItemQuantity: 1,
        failure: '',
        success: '',
        isLoading: false,
      ));

  @override
  InventoryState? fromJson(Map<String, dynamic> json) {
    return InventoryState(
      newItemName: json['newItemName'] as String,
      newItemQuantity: json['newItemQuantity'] as int,
      isLoading: json['isLoading'] as bool,
      success: json['success'] as String,
      failure: json['failure'] as String,
    );
  }

  @override
  Map<String, dynamic>? toJson(InventoryState state) {
    return <String, dynamic>{
      'newItemName': state.newItemName,
      'newItemQuantity': state.newItemQuantity,
      'isLoading': state.isLoading,
      'success': state.success,
      'failure': state.failure
    };
  }

  @override
  Future<void> close() async{
    await Hive.close();
    return super.close();
  }
}
