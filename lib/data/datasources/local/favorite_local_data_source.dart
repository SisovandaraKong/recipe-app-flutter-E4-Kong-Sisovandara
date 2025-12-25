import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../core/error/exceptions.dart';
import '../../../domain/entities/meal.dart';
import '../../models/meal_model.dart';
import 'app_database.dart';

/// Local data source for favorite meals using Drift
abstract class FavoriteLocalDataSource {
  Future<List<MealModel>> getFavoriteMeals();
  Future<void> addFavorite(MealModel meal);
  Future<void> removeFavorite(String mealId);
  Future<bool> isFavorite(String mealId);
  Future<List<String>> getFavoriteIds();
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final AppDatabase database;

  FavoriteLocalDataSourceImpl({required this.database});

  @override
  Future<List<MealModel>> getFavoriteMeals() async {
    try {
      final favorites = await database.getAllFavorites();
      return favorites.map((fav) => _favoriteMealToModel(fav)).toList();
    } catch (e) {
      throw DatabaseException('Failed to get favorites: ${e.toString()}');
    }
  }

  @override
  Future<void> addFavorite(MealModel meal) async {
    try {
      final companion = FavoriteMealsCompanion(
        id: Value(meal.id),
        meal: Value(meal.meal),
        drinkAlternate: Value(meal.drinkAlternate),
        category: Value(meal.category),
        area: Value(meal.area),
        instructions: Value(meal.instructions),
        mealThumb: Value(meal.mealThumb),
        tags: Value(meal.tags),
        youtube: Value(meal.youtube),
        source: Value(meal.source),
        ingredients: Value(jsonEncode(meal.ingredients.map((e) => e.toJson()).toList())),
        categoryId: Value(meal.categoryId),
      );
      await database.insertFavorite(companion);
    } catch (e) {
      throw DatabaseException('Failed to add favorite: ${e.toString()}');
    }
  }

  @override
  Future<void> removeFavorite(String mealId) async {
    try {
      await database.deleteFavorite(mealId);
    } catch (e) {
      throw DatabaseException('Failed to remove favorite: ${e.toString()}');
    }
  }

  @override
  Future<bool> isFavorite(String mealId) async {
    try {
      return await database.isFavorite(mealId);
    } catch (e) {
      throw DatabaseException('Failed to check favorite: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    try {
      return await database.getFavoriteIds();
    } catch (e) {
      throw DatabaseException('Failed to get favorite IDs: ${e.toString()}');
    }
  }

  MealModel _favoriteMealToModel(FavoriteMeal fav) {
    final ingredientsJson = jsonDecode(fav.ingredients) as List<dynamic>;
    final ingredients = ingredientsJson
        .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return MealModel(
      id: fav.id,
      meal: fav.meal,
      drinkAlternate: fav.drinkAlternate,
      category: fav.category,
      area: fav.area,
      instructions: fav.instructions,
      mealThumb: fav.mealThumb,
      tags: fav.tags,
      youtube: fav.youtube,
      source: fav.source,
      ingredients: ingredients,
      categoryId: fav.categoryId,
    );
  }
}
