import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';

/// Abstract repository for favorite meal operations
abstract class FavoriteRepository {
  /// Get all favorite meals from local storage
  Future<Either<Failure, List<Meal>>> getFavoriteMeals();

  /// Add a meal to favorites
  Future<Either<Failure, void>> addFavorite(Meal meal);

  /// Remove a meal from favorites
  Future<Either<Failure, void>> removeFavorite(String mealId);

  /// Check if a meal is in favorites
  Future<Either<Failure, bool>> isFavorite(String mealId);

  /// Get favorite meal IDs
  Future<Either<Failure, List<String>>> getFavoriteIds();
}
