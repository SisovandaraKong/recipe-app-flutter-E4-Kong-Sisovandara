import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/meal_providers.dart';
import '../../providers/category_providers.dart';
import '../../widgets/meal_card.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/loading_widgets.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore Recipes',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Filter Chips
          Container(
            height: 64,
            decoration: const BoxDecoration(
              color: AppColors.background,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.divider,
                  width: 1,
                ),
              ),
            ),
            child: categoriesAsync.when(
              data: (categories) => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: FilterChip(
                          label: const Text('All'),
                          selected: selectedCategory == null,
                          onSelected: (selected) {
                            if (selected) {
                              ref.read(selectedCategoryProvider.notifier).state = null;
                            }
                          },
                          backgroundColor: AppColors.surface,
                          selectedColor: AppColors.primary,
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(
                            color: selectedCategory == null
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          elevation: selectedCategory == null ? 2 : 0,
                        ),
                      ),
                    );
                  }

                  final category = categories[index - 1];
                  final isSelected = selectedCategory == category.id;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: FilterChip(
                        label: Text(category.name),
                        selected: isSelected,
                        onSelected: (selected) {
                          ref.read(selectedCategoryProvider.notifier).state =
                              selected ? category.id : null;
                        },
                        backgroundColor: AppColors.surface,
                        selectedColor: AppColors.primary,
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        elevation: isSelected ? 2 : 0,
                      ),
                    ),
                  );
                },
              ),
              loading: () => const LoadingWidget(),
              error: (error, stack) => const SizedBox.shrink(),
            ),
          ),

          // Meals Grid
          Expanded(
            child: selectedCategory == null
                ? const _AllMealsView()
                : _FilteredMealsView(categoryId: selectedCategory),
          ),
        ],
      ),
    );
  }
}

class _AllMealsView extends ConsumerWidget {
  const _AllMealsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsync = ref.watch(mealsProvider);

    return mealsAsync.when(
      data: (meals) {
        if (meals.isEmpty) {
          return const EmptyStateWidget(
            icon: Icons.restaurant_menu_rounded,
            title: 'No Recipes Found',
            message: 'We couldn\'t find any recipes at the moment.',
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return MealCard(
              meal: meal,
              heroTag: 'meal-explore-${meal.id}',
              onTap: () => context.push('/meal/${meal.id}', extra: meal),
            );
          },
        );
      },
      loading: () => GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => const MealCardSkeleton(),
      ),
      error: (error, stack) => ErrorMessageWidget(
        message: 'Failed to load recipes',
        onRetry: () => ref.invalidate(mealsProvider),
      ),
    );
  }
}

class _FilteredMealsView extends ConsumerWidget {
  final String categoryId;

  const _FilteredMealsView({required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsync = ref.watch(mealsByCategoryProvider(categoryId));

    return mealsAsync.when(
      data: (meals) {
        if (meals.isEmpty) {
          return const EmptyStateWidget(
            icon: Icons.search_off_rounded,
            title: 'No Recipes Found',
            message: 'No meals found in this category.',
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return MealCard(
              meal: meal,
              heroTag: 'meal-category-${meal.id}',
              onTap: () => context.push('/meal/${meal.id}', extra: meal),
            );
          },
        );
      },
      loading: () => GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => const MealCardSkeleton(),
      ),
      error: (error, stack) => ErrorMessageWidget(
        message: 'Failed to load recipes',
        onRetry: () => ref.invalidate(mealsByCategoryProvider(categoryId)),
      ),
    );
  }
}
