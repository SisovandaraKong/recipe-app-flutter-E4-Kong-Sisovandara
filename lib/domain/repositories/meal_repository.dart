import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';
import '../entities/category.dart';

/// Abstract repository for meal-related operations
abstract class MealRepository {
  /// Get all meals from the API
  Future<Either<Failure, List<Meal>>> getMeals();

  /// Get meals filtered by category
  Future<Either<Failure, List<Meal>>> getMealsByCategory(String categoryId);

  /// Get a single meal by ID
  Future<Either<Failure, Meal>> getMealById(String id);

  /// Get all categories
  Future<Either<Failure, List<Category>>> getCategories();

  /// Get random meal
  Future<Either<Failure, Meal>> getRandomMeal();

  /// Get popular meals (first N meals)
  Future<Either<Failure, List<Meal>>> getPopularMeals({int limit = 10});

  /// Get unique areas/cuisines from meals
  Future<Either<Failure, List<String>>> getAreas();
}
