import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

/// Use case for getting a random meal
class GetRandomMeal {
  final MealRepository repository;

  GetRandomMeal(this.repository);

  Future<Either<Failure, Meal>> call() async {
    return await repository.getRandomMeal();
  }
}
