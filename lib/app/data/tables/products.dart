import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  RealColumn get price => real()();

  TextColumn get image => text().nullable()();

  TextColumn get description => text().nullable()();

  IntColumn get categoryId => integer().nullable()();
}