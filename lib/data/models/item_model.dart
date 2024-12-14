class Item {
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

  Item({
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
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      companyNo: json['COMAPNYNO'] ?? '',
      itemNo: json['ITEMNO'] ?? '',
      name: json['NAME'] ?? '',
      categoryId: json['CATEOGRYID'] ?? '',
      itemK: json['ItemK'] ?? '',
      barcode: json['BARCODE'] ?? '',
      minPrice: json['MINPRICE'] ?? '',
      itemL: json['ITEML'] ?? '',
      isSuspended: json['ISSUSPENDED'] ?? '',
      fD: json['F_D'] ?? '',
      itemHasSerial: json['ITEMHASSERIAL'] ?? '',
      itemPicsPath: json['ITEMPICSPATH'] ?? '',
      taxPerc: json['TAXPERC'] ?? '',
      isApiPic: json['ISAPIPIC'] ?? '',
      lsPrice: json['LSPRICE'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'COMAPNYNO': companyNo,
      'ITEMNO': itemNo,
      'NAME': name,
      'CATEOGRYID': categoryId,
      'ItemK': itemK,
      'BARCODE': barcode,
      'MINPRICE': minPrice,
      'ITEML': itemL,
      'ISSUSPENDED': isSuspended,
      'F_D': fD,
      'ITEMHASSERIAL': itemHasSerial,
      'ITEMPICSPATH': itemPicsPath,
      'TAXPERC': taxPerc,
      'ISAPIPIC': isApiPic,
      'LSPRICE': lsPrice,
    };
  }
}

class ItemsMaster {
  final List<Item> items;

  ItemsMaster({required this.items});

  factory ItemsMaster.fromJson(Map<String, dynamic> json) {
    return ItemsMaster(
      items: (json['Items_Master'] as List<dynamic>)
          .map((item) => Item.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Items_Master': items.map((item) => item.toJson()).toList(),
    };
  }
}
