import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

/// Use case for getting meals by category
class GetMealsByCategory {
  final MealRepository repository;

  GetMealsByCategory(this.repository);

  Future<Either<Failure, List<Meal>>> call(String categoryId) async {
    return await repository.getMealsByCategory(categoryId);
  }
}
