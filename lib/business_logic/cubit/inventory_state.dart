import 'package:flutter/cupertino.dart';
import 'package:inventory_system/data/models/InventoryItem.dart';

@immutable
sealed class InventoryState {}

final class InventoryInitial extends InventoryState {}


class InventorySuccess extends InventoryState {
  InventorySuccess(this.inventory);

  final List<InventoryItem> inventory;
}

  class InventoryLoading extends InventoryState {}

  class InventoryFailure extends InventoryState {
  final String errMessage;

   InventoryFailure(this.errMessage);
  }


