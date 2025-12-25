import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/meal.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/remote/meal_remote_data_source.dart';

/// Implementation of MealRepository
class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Meal>>> getMeals() async {
    try {
      final meals = await remoteDataSource.getMeals();
      return Right(meals.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> getMealsByCategory(String categoryId) async {
    try {
      final meals = await remoteDataSource.getMealsByCategory(categoryId);
      return Right(meals.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Meal>> getMealById(String id) async {
    try {
      final meal = await remoteDataSource.getMealById(id);
      return Right(meal.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Meal>> getRandomMeal() async {
    try {
      final meals = await remoteDataSource.getMeals();
      if (meals.isEmpty) {
        return const Left(ServerFailure('No meals available'));
      }
      meals.shuffle();
      return Right(meals.first.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> getPopularMeals({int limit = 10}) async {
    try {
      final meals = await remoteDataSource.getMeals();
      final popularMeals = meals.take(limit).toList();
      return Right(popularMeals.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAreas() async {
    try {
      final meals = await remoteDataSource.getMeals();
      final areas = meals.map((meal) => meal.area).toSet().toList();
      areas.sort();
      return Right(areas);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
