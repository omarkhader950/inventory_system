class SalesmanItemBalance {
  final String companyNo;
  final String stockCode;
  final String itemOCode;
  final String qty;

  SalesmanItemBalance({
    required this.companyNo,
    required this.stockCode,
    required this.itemOCode,
    required this.qty,
  });

  factory SalesmanItemBalance.fromJson(Map<String, dynamic> json) {
    return SalesmanItemBalance(
      companyNo: json['COMAPNYNO'] ?? '',
      stockCode: json['STOCK_CODE'] ?? '',
      itemOCode: json['ItemOCode'] ?? '',
      qty: json['QTY'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'COMAPNYNO': companyNo,
      'STOCK_CODE': stockCode,
      'ItemOCode': itemOCode,
      'QTY': qty,
    };
  }
}

class SalesmanItemsBalance {
  final List<SalesmanItemBalance> itemsBalance;

  SalesmanItemsBalance({required this.itemsBalance});

  factory SalesmanItemsBalance.fromJson(Map<String, dynamic> json) {
    return SalesmanItemsBalance(
      itemsBalance: (json['SalesMan_Items_Balance'] as List<dynamic>)
          .map((item) => SalesmanItemBalance.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SalesMan_Items_Balance': itemsBalance.map((item) => item.toJson()).toList(),
    };
  }
}
