import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_client.dart';
import '../../data/datasources/local/app_database.dart';
import '../../data/datasources/local/favorite_local_data_source.dart';
import '../../data/datasources/remote/meal_remote_data_source.dart';
import '../../data/repositories/favorite_repository_impl.dart';
import '../../data/repositories/meal_repository_impl.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../../domain/repositories/meal_repository.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_meals.dart';
import '../../domain/usecases/get_meals_by_category.dart';
import '../../domain/usecases/get_random_meal.dart';
import '../../domain/usecases/manage_favorites.dart';

// Core Providers
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Data Source Providers
final mealRemoteDataSourceProvider = Provider<MealRemoteDataSource>((ref) {
  return MealRemoteDataSourceImpl(
    dioClient: ref.watch(dioClientProvider),
  );
});

final favoriteLocalDataSourceProvider = Provider<FavoriteLocalDataSource>((ref) {
  return FavoriteLocalDataSourceImpl(
    database: ref.watch(databaseProvider),
  );
});

// Repository Providers
final mealRepositoryProvider = Provider<MealRepository>((ref) {
  return MealRepositoryImpl(
    remoteDataSource: ref.watch(mealRemoteDataSourceProvider),
  );
});

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepositoryImpl(
    localDataSource: ref.watch(favoriteLocalDataSourceProvider),
  );
});

// Use Case Providers
final getMealsUseCaseProvider = Provider<GetMeals>((ref) {
  return GetMeals(ref.watch(mealRepositoryProvider));
});

final getCategoriesUseCaseProvider = Provider<GetCategories>((ref) {
  return GetCategories(ref.watch(mealRepositoryProvider));
});

final getMealsByCategoryUseCaseProvider = Provider<GetMealsByCategory>((ref) {
  return GetMealsByCategory(ref.watch(mealRepositoryProvider));
});

final getRandomMealUseCaseProvider = Provider<GetRandomMeal>((ref) {
  return GetRandomMeal(ref.watch(mealRepositoryProvider));
});

final manageFavoritesUseCaseProvider = Provider<ManageFavorites>((ref) {
  return ManageFavorites(ref.watch(favoriteRepositoryProvider));
});
