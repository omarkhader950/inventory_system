

import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../data/models/InventoryItem.dart';

class InventoryItemCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Name
            Text(
              item.name,
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Barcode with Icon
            Row(
              children: [
                Icon(Icons.qr_code, color: Colors.grey[700], size: 20),
                const SizedBox(width: 8),
                Text(
                  'Barcode: ${item.barcode}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Quantity with Conditional Highlighting
            Row(
              children: [
                Icon(Icons.inventory_2_outlined, color: Colors.grey[700], size: 20),
                const SizedBox(width: 8),
                Text(
                  'Quantity: ${double.tryParse(item.qty ?? '0')!.toStringAsFixed(2)}',
                  style: double.tryParse(item.qty ?? '0')! < 5
                      ? Styles.textStyle16.copyWith(color: Colors.red)
                      : Styles.textStyle16.copyWith(color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Company and Stock Code
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Company No: ${item.companyNo}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  'Stock Code: ${item.stockCode}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            Divider(color: Colors.grey[300]),

            // Prices
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Min Price: ${item.minPrice}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  'List Price: ${double.tryParse(item.lsPrice ?? '0')!.toStringAsFixed(2)}',
                  style: Styles.textStyle14.copyWith(color: Colors.blueAccent),
                ),
              ],
            ),
            Divider(color: Colors.grey[300]),

            // Factor Discount and Tax Percentage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Factor Discount: ${item.fD}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  'Tax: ${item.taxPerc}%',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Additional Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category: ${item.categoryId}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  'Item Level: ${item.itemL}',
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
