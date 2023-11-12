part of 'inventory_cubit.dart';

@freezed
/// Inventory state
class InventoryState with _$InventoryState {
  /// default factory constructor
  const factory InventoryState({
    required String success,
    required String failure,
    required String newItemName,
    required int newItemQuantity,
    required bool isLoading,
  }) = _InventoryState;

  /// empty factory
  factory InventoryState.empty() => const InventoryState(
      success: '',
      failure: '',
      newItemName: '',
      newItemQuantity: 1,
      isLoading: false);

}
