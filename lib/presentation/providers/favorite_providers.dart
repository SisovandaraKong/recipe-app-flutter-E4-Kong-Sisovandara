import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/meal.dart';
import '../../domain/usecases/manage_favorites.dart';
import 'providers.dart';

/// Notifier for managing favorites (Riverpod 3.0)
class FavoritesNotifier extends AsyncNotifier<List<Meal>> {
  late ManageFavorites _manageFavorites;

  @override
  Future<List<Meal>> build() async {
    _manageFavorites = ref.watch(manageFavoritesUseCaseProvider);
    return await _loadFavorites();
  }

  Future<List<Meal>> _loadFavorites() async {
    final result = await _manageFavorites.getFavorites();
    return result.fold(
      (failure) => throw failure.message,
      (favorites) => favorites,
    );
  }

  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _loadFavorites());
  }

  Future<void> addFavorite(Meal meal) async {
    final result = await _manageFavorites.addFavorite(meal);
    await result.fold(
      (failure) async {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (_) async => await loadFavorites(),
    );
  }

  Future<void> removeFavorite(String mealId) async {
    final result = await _manageFavorites.removeFavorite(mealId);
    await result.fold(
      (failure) async {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (_) async => await loadFavorites(),
    );
  }

  Future<bool> isFavorite(String mealId) async {
    final result = await _manageFavorites.isFavorite(mealId);
    return result.fold(
      (failure) => false,
      (isFav) => isFav,
    );
  }

  Future<void> toggleFavorite(Meal meal) async {
    final isFav = await isFavorite(meal.id);
    if (isFav) {
      await removeFavorite(meal.id);
    } else {
      await addFavorite(meal);
    }
  }
}

/// Provider for favorites notifier (Riverpod 3.0)
final favoritesProvider = AsyncNotifierProvider<FavoritesNotifier, List<Meal>>(() {
  return FavoritesNotifier();
});

/// Provider to check if a meal is favorite
final isFavoriteProvider = FutureProvider.family<bool, String>((ref, mealId) async {
  final notifier = ref.watch(favoritesProvider.notifier);
  return await notifier.isFavorite(mealId);
});
