import '../../domain/entities/category.dart';

/// Data model for Category
class CategoryModel {
  final String id;
  final String category;
  final String categoryThumb;
  final String categoryDescription;

  CategoryModel({
    required this.id,
    required this.category,
    required this.categoryThumb,
    required this.categoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String? ?? '',
      category: json['category'] as String? ?? '',
      categoryThumb: json['categoryThumb'] as String? ?? '',
      categoryDescription: json['categoryDescription'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'categoryThumb': categoryThumb,
      'categoryDescription': categoryDescription,
    };
  }

  Category toEntity() {
    return Category(
      id: id,
      name: category,
      imageUrl: categoryThumb,
      description: categoryDescription,
    );
  }

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      category: category.name,
      categoryThumb: category.imageUrl,
      categoryDescription: category.description,
    );
  }
}
