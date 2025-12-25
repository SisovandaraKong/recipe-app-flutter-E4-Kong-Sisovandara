import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../core/constants/app_constants.dart';

part 'app_database.g.dart';

/// Favorite meals table
class FavoriteMeals extends Table {
  TextColumn get id => text()();
  TextColumn get meal => text()();
  TextColumn get drinkAlternate => text().nullable()();
  TextColumn get category => text()();
  TextColumn get area => text()();
  TextColumn get instructions => text()();
  TextColumn get mealThumb => text()();
  TextColumn get tags => text().nullable()();
  TextColumn get youtube => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get ingredients => text()(); // JSON string
  TextColumn get categoryId => text()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FavoriteMeals])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => AppConstants.databaseVersion;

  // Queries for favorite meals
  Future<List<FavoriteMeal>> getAllFavorites() => select(favoriteMeals).get();

  Future<FavoriteMeal?> getFavoriteById(String id) =>
      (select(favoriteMeals)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<int> insertFavorite(FavoriteMealsCompanion meal) =>
      into(favoriteMeals).insert(
        meal,
        mode: InsertMode.insertOrReplace,
      );

  Future<int> deleteFavorite(String id) =>
      (delete(favoriteMeals)..where((tbl) => tbl.id.equals(id))).go();

  Future<bool> isFavorite(String id) async {
    final result = await getFavoriteById(id);
    return result != null;
  }

  Future<List<String>> getFavoriteIds() async {
    final favorites = await getAllFavorites();
    return favorites.map((e) => e.id).toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstants.databaseName));
    return NativeDatabase(file);
  });
}
