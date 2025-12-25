import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/meal.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../datasources/local/favorite_local_data_source.dart';
import '../models/meal_model.dart';

/// Implementation of FavoriteRepository
class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Meal>>> getFavoriteMeals() async {
    try {
      final favorites = await localDataSource.getFavoriteMeals();
      return Right(favorites.map((model) => model.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite(Meal meal) async {
    try {
      final model = MealModel.fromEntity(meal);
      await localDataSource.addFavorite(model);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String mealId) async {
    try {
      await localDataSource.removeFavorite(mealId);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String mealId) async {
    try {
      final result = await localDataSource.isFavorite(mealId);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavoriteIds() async {
    try {
      final ids = await localDataSource.getFavoriteIds();
      return Right(ids);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
