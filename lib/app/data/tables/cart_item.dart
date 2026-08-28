import 'package:drift/drift.dart';

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get productId => text()();

  TextColumn get productName => text()();

  RealColumn get price => real()();

  IntColumn get quantity => integer()();

  RealColumn get discount =>
      real().withDefault(const Constant(0))();

  TextColumn get image => text().nullable()();

  TextColumn get cupSize => text()();

  TextColumn get sugarLevel => text()();

  TextColumn get iceLevel => text()();

  TextColumn get toppings => text().nullable()();
}