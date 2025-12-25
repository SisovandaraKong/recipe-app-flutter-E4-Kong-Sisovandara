import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/meal.dart';
import 'providers.dart';

/// Provider for fetching all meals
final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  final useCase = ref.watch(getMealsUseCaseProvider);
  final result = await useCase();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (meals) => meals,
  );
});

/// Provider for fetching popular meals
final popularMealsProvider = FutureProvider<List<Meal>>((ref) async {
  final repository = ref.watch(mealRepositoryProvider);
  final result = await repository.getPopularMeals(limit: 10);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (meals) => meals,
  );
});

/// Provider for fetching a random meal
final randomMealProvider = FutureProvider<Meal>((ref) async {
  final useCase = ref.watch(getRandomMealUseCaseProvider);
  final result = await useCase();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (meal) => meal,
  );
});

/// Provider for fetching meals by category
final mealsByCategoryProvider = FutureProvider.family<List<Meal>, String>((ref, categoryId) async {
  final useCase = ref.watch(getMealsByCategoryUseCaseProvider);
  final result = await useCase(categoryId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (meals) => meals,
  );
});

/// Provider for fetching all areas
final areasProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(mealRepositoryProvider);
  final result = await repository.getAreas();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (areas) => areas,
  );
});
