import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../data/models/InventoryItem.dart';
import 'inventory_item_card.dart';

class InventoryListView extends StatelessWidget {
  final List<InventoryItem> mergedItems;

  InventoryListView({required this.mergedItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Inventory List',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: mergedItems.length,
            itemBuilder: (context, index) {
              final item = mergedItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InventoryItemCard(item: item),
              );
            },
          ),
        ),
      ],
    );
  }
}
