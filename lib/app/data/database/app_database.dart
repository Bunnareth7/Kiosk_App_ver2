import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:kiosk_app/app/data/tables/cart_item.dart';
import 'package:kiosk_app/app/data/tables/products.dart';


part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Products,
    CartItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'kiosk_database',
  );
}