import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_system/presentation/screens/inventory_screen.dart';
import 'data/repositories/inventory_repository.dart';
import 'data/web_services/inventory_api_datasource.dart';
import 'data/local/inventory_local_datasource.dart';
import 'business_logic/cubit/inventory_cubit.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiDataSource = InventoryApiDataSource(dio);
    final localDataSource = InventoryLocalDataSource();
    final repository = InventoryRepository(
      inventoryApiDataSource: apiDataSource,
      inventoryLocalDataSource: localDataSource,
    );

    return BlocProvider(
      create: (context) => InventoryCubit(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventory System',
        home: InventoryScreen(),
      ),
    );
  }
}
