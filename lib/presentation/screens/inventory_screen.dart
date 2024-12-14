import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/inventory_cubit.dart';
import '../../business_logic/cubit/inventory_state.dart';
import '../widgets/inventory_list_view .dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().fetchAllInventoryItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory System'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Data',
            onPressed: () async {
              try {
                await context.read<InventoryCubit>().fetchAllInventoryItems();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data refreshed successfully!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to refresh data.')),
                );
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade200, Colors.grey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocBuilder<InventoryCubit, InventoryState>(
          builder: (context, state) {
            if (state is InventoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is InventorySuccess) {
              final items = state.inventory;
              return items.isEmpty
                  ? const Center(child: Text('No items found.'))
                  : InventoryListView(mergedItems: items);
            } else if (state is InventoryFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
