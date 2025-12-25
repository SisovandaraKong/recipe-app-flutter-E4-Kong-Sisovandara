import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

/// Use case for getting all meals
class GetMeals {
  final MealRepository repository;

  GetMeals(this.repository);

  Future<Either<Failure, List<Meal>>> call() async {
    return await repository.getMeals();
  }
}
