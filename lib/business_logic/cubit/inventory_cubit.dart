import 'package:bloc/bloc.dart';


import '../../data/repositories/inventory_repository.dart';
import 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit(this.inventoryRepository) : super(InventoryInitial());

  final InventoryRepository inventoryRepository;

  Future<void> fetchAllInventoryItems() async {

    emit(InventoryLoading()); // Emit loading state
    try {
      // Attempt to fetch data
      final inventoryItems = await inventoryRepository.fetchAndCacheInventory();
      emit(InventorySuccess(inventoryItems)); // Emit success state
    } catch (e) {
      // Emit failure state

      emit(InventoryFailure(
          'Unable to fetch inventory. Please check your internet connection or try again later.'));
    }
  }
}
