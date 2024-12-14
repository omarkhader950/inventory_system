import '../local/inventory_local_datasource.dart';
import '../models/InventoryItem.dart';
import '../web_services/inventory_api_datasource.dart';

class InventoryRepository {
  final InventoryApiDataSource inventoryApiDataSource;
  final InventoryLocalDataSource inventoryLocalDataSource;

  InventoryRepository({
    required this.inventoryApiDataSource,
    required this.inventoryLocalDataSource,
  });

  Future<List<InventoryItem>> fetchAndCacheInventory() async {
    try {
      // Attempt to fetch and merge data from API
      final mergedItems = await fetchMergedInventory();

      // Store the merged items in SQLite
      await storeInventoryInDb(mergedItems);

      return mergedItems;
    } catch (e) {
      // If fetching from API fails, fall back to the cached data
      print('Error fetching from API: $e. Loading from SQLite.');
      return await fetchCachedInventory();
    }
  }

  // Merge items and quantities based on itemNo and itemOCode
  Future<List<InventoryItem>> fetchMergedInventory() async {
    try {
      // Fetch both lists
      final items = await inventoryApiDataSource.fetchItems();
      final quantities = await inventoryApiDataSource.fetchQuantities();

      // Create a map for quick lookup by itemOCode
      final quantitiesMap = {
        for (var balance in quantities) balance.itemOCode: balance,
      };

      // Merge the lists based on itemNo
      final mergedItems = items
          .where((item) => quantitiesMap.containsKey(item.itemNo))
          .map((item) {
        final balance = quantitiesMap[item.itemNo]!;
        return InventoryItem.fromItemAndBalance(item, balance);
      }).toList();

      return mergedItems;
    } catch (e) {
      throw Exception('Error merging inventory data: $e');
    }
  }

//database fun

  Future<List<InventoryItem>> fetchCachedInventory() async {
    return await inventoryLocalDataSource.fetchMergedItems();
  }

  Future<void> storeInventoryInDb(List<InventoryItem> mergedItems) async {
    await inventoryLocalDataSource.insertMergedItems(mergedItems);
  }
}
