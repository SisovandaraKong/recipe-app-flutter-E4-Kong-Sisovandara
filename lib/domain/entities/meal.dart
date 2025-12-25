import 'package:equatable/equatable.dart';

/// Ingredient entity representing a recipe ingredient
class Ingredient extends Equatable {
  final String name;
  final String measure;

  const Ingredient({
    required this.name,
    required this.measure,
  });

  @override
  List<Object?> get props => [name, measure];
}

/// Meal entity representing a recipe
class Meal extends Equatable {
  final String id;
  final String name;
  final String? drinkAlternate;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;
  final String? tags;
  final String? youtubeUrl;
  final String? sourceUrl;
  final List<Ingredient> ingredients;
  final String categoryId;

  const Meal({
    required this.id,
    required this.name,
    this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    this.tags,
    this.youtubeUrl,
    this.sourceUrl,
    required this.ingredients,
    required this.categoryId,
  });

  /// Get list of tags from comma-separated string
  List<String> get tagsList {
    if (tags == null || tags!.isEmpty) return [];
    return tags!.split(',').map((e) => e.trim()).toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        drinkAlternate,
        category,
        area,
        instructions,
        imageUrl,
        tags,
        youtubeUrl,
        sourceUrl,
        ingredients,
        categoryId,
      ];
}
