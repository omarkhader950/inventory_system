import 'package:dio/dio.dart';
import '../../constants/strings.dart';
import '../models/salesman_Item_balance.dart';
import '../models/item_model.dart';

class InventoryApiDataSource {
  final Dio _dio;

  InventoryApiDataSource(this._dio);

  // Fetch Items_Master data
  Future<List<Item>> fetchItems() async {


    try {
      final response = await _dio.get(fetchItemsUrl);

      if (response.statusCode == 200) {
        final data = response.data['Items_Master'] as List;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch items: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }

  Future<List<SalesmanItemBalance>> fetchQuantities() async {


    try {
      final response = await _dio.get(fetchQuantitiesUrl);

      if (response.statusCode == 200) {
        final data = response.data['SalesMan_Items_Balance'] as List;

        // Validate and parse each item
        return data
            .map((json) => SalesmanItemBalance.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch quantities: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching quantities: $e');
    }
  }
}
