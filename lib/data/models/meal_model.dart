import '../../domain/entities/meal.dart';

/// Data model for Ingredient
class IngredientModel {
  final String ingredient;
  final String measure;

  IngredientModel({
    required this.ingredient,
    required this.measure,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      ingredient: json['ingredient'] as String? ?? '',
      measure: json['measure'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient,
      'measure': measure,
    };
  }

  Ingredient toEntity() {
    return Ingredient(
      name: ingredient,
      measure: measure,
    );
  }
}

/// Data model for Meal
class MealModel {
  final String id;
  final String meal;
  final String? drinkAlternate;
  final String category;
  final String area;
  final String instructions;
  final String mealThumb;
  final String? tags;
  final String? youtube;
  final String? source;
  final List<IngredientModel> ingredients;
  final String categoryId;

  MealModel({
    required this.id,
    required this.meal,
    this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.mealThumb,
    this.tags,
    this.youtube,
    this.source,
    required this.ingredients,
    required this.categoryId,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    final ingredientsList = json['ingredients'] as List<dynamic>?;
    final ingredients = ingredientsList
            ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return MealModel(
      id: json['id'] as String? ?? '',
      meal: json['meal'] as String? ?? '',
      drinkAlternate: json['drinkAlternate'] as String?,
      category: json['category'] as String? ?? '',
      area: json['area'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
      mealThumb: json['mealThumb'] as String? ?? '',
      tags: json['tags'] as String?,
      youtube: json['youtube'] as String?,
      source: json['source'] as String?,
      ingredients: ingredients,
      categoryId: json['categoryId'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meal': meal,
      'drinkAlternate': drinkAlternate,
      'category': category,
      'area': area,
      'instructions': instructions,
      'mealThumb': mealThumb,
      'tags': tags,
      'youtube': youtube,
      'source': source,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'categoryId': categoryId,
    };
  }

  Meal toEntity() {
    return Meal(
      id: id,
      name: meal,
      drinkAlternate: drinkAlternate,
      category: category,
      area: area,
      instructions: instructions,
      imageUrl: mealThumb,
      tags: tags,
      youtubeUrl: youtube,
      sourceUrl: source,
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
      categoryId: categoryId,
    );
  }

  factory MealModel.fromEntity(Meal meal) {
    return MealModel(
      id: meal.id,
      meal: meal.name,
      drinkAlternate: meal.drinkAlternate,
      category: meal.category,
      area: meal.area,
      instructions: meal.instructions,
      mealThumb: meal.imageUrl,
      tags: meal.tags,
      youtube: meal.youtubeUrl,
      source: meal.sourceUrl,
      ingredients: meal.ingredients
          .map((e) => IngredientModel(
                ingredient: e.name,
                measure: e.measure,
              ))
          .toList(),
      categoryId: meal.categoryId,
    );
  }
}
