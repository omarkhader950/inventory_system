import 'salesman_Item_balance.dart';
import 'item_model.dart';

class InventoryItem {
  final String companyNo;
  final String itemNo;
  final String name;
  final String categoryId;
  final String itemK;
  final String barcode;
  final String minPrice;
  final String itemL;
  final String isSuspended;
  final String fD;
  final String itemHasSerial;
  final String itemPicsPath;
  final String taxPerc;
  final String isApiPic;
  final String lsPrice;
  final String stockCode;
  final String qty;

  InventoryItem({
    required this.companyNo,
    required this.itemNo,
    required this.name,
    required this.categoryId,
    required this.itemK,
    required this.barcode,
    required this.minPrice,
    required this.itemL,
    required this.isSuspended,
    required this.fD,
    required this.itemHasSerial,
    required this.itemPicsPath,
    required this.taxPerc,
    required this.isApiPic,
    required this.lsPrice,
    required this.stockCode,
    required this.qty,
  });

  factory InventoryItem.fromItemAndBalance(Item item, SalesmanItemBalance balance) {
    return InventoryItem(
      companyNo: item.companyNo,
      itemNo: item.itemNo,
      name: item.name,
      categoryId: item.categoryId,
      itemK: item.itemK,
      barcode: item.barcode,
      minPrice: item.minPrice,
      itemL: item.itemL,
      isSuspended: item.isSuspended,
      fD: item.fD,
      itemHasSerial: item.itemHasSerial,
      itemPicsPath: item.itemPicsPath,
      taxPerc: item.taxPerc,
      isApiPic: item.isApiPic,
      lsPrice: item.lsPrice,
      stockCode: balance.stockCode,
      qty: balance.qty,
    );
  }
}
