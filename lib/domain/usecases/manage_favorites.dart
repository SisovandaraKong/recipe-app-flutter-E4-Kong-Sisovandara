import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meal.dart';
import '../repositories/favorite_repository.dart';

/// Use case for managing favorite meals
class ManageFavorites {
  final FavoriteRepository repository;

  ManageFavorites(this.repository);

  Future<Either<Failure, List<Meal>>> getFavorites() async {
    return await repository.getFavoriteMeals();
  }

  Future<Either<Failure, void>> addFavorite(Meal meal) async {
    return await repository.addFavorite(meal);
  }

  Future<Either<Failure, void>> removeFavorite(String mealId) async {
    return await repository.removeFavorite(mealId);
  }

  Future<Either<Failure, bool>> isFavorite(String mealId) async {
    return await repository.isFavorite(mealId);
  }

  Future<Either<Failure, List<String>>> getFavoriteIds() async {
    return await repository.getFavoriteIds();
  }
}
