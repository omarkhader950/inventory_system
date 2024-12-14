import 'package:sqflite/sqflite.dart';

import '../models/InventoryItem.dart';
import 'database_helper.dart';

class InventoryLocalDataSource {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Insert a list of MergedItems
  Future<void> insertMergedItems(List<InventoryItem> mergedItems) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var mergedItem in mergedItems) {
      batch.insert(
        'MergedItems',
        {
          'companyNo': mergedItem.companyNo,
          'itemNo': mergedItem.itemNo,
          'name': mergedItem.name,
          'categoryId': mergedItem.categoryId,
          'itemK': mergedItem.itemK,
          'barcode': mergedItem.barcode,
          'minPrice': mergedItem.minPrice,
          'itemL': mergedItem.itemL,
          'isSuspended': mergedItem.isSuspended,
          'fD': mergedItem.fD,
          'itemHasSerial': mergedItem.itemHasSerial,
          'itemPicsPath': mergedItem.itemPicsPath,
          'taxPerc': mergedItem.taxPerc,
          'isApiPic': mergedItem.isApiPic,
          'lsPrice': mergedItem.lsPrice,
          'stockCode': mergedItem.stockCode,
          'qty': mergedItem.qty,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Execute the batch insert
    await batch.commit(noResult: true);
  }

  Future<void> insertMergedItem(InventoryItem mergedItem) async {
    final db = await _dbHelper.database;

    await db.insert(
      'MergedItems',
      {
        'companyNo': mergedItem.companyNo,
        'itemNo': mergedItem.itemNo,
        'name': mergedItem.name,
        'categoryId': mergedItem.categoryId,
        'itemK': mergedItem.itemK,
        'barcode': mergedItem.barcode,
        'minPrice': mergedItem.minPrice,
        'itemL': mergedItem.itemL,
        'isSuspended': mergedItem.isSuspended,
        'fD': mergedItem.fD,
        'itemHasSerial': mergedItem.itemHasSerial,
        'itemPicsPath': mergedItem.itemPicsPath,
        'taxPerc': mergedItem.taxPerc,
        'isApiPic': mergedItem.isApiPic,
        'lsPrice': mergedItem.lsPrice,
        'stockCode': mergedItem.stockCode,
        'qty': mergedItem.qty,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<InventoryItem>> fetchMergedItems() async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query('MergedItems');

    return List.generate(maps.length, (i) {
      return InventoryItem(
        companyNo: maps[i]['companyNo'],
        itemNo: maps[i]['itemNo'],
        name: maps[i]['name'],
        categoryId: maps[i]['categoryId'],
        itemK: maps[i]['itemK'],
        barcode: maps[i]['barcode'],
        minPrice: maps[i]['minPrice'],
        itemL: maps[i]['itemL'],
        isSuspended: maps[i]['isSuspended'],
        fD: maps[i]['fD'],
        itemHasSerial: maps[i]['itemHasSerial'],
        itemPicsPath: maps[i]['itemPicsPath'],
        taxPerc: maps[i]['taxPerc'],
        isApiPic: maps[i]['isApiPic'],
        lsPrice: maps[i]['lsPrice'],
        stockCode: maps[i]['stockCode'],
        qty: maps[i]['qty'],
      );
    });
  }
}
