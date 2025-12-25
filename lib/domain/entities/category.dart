import 'package:equatable/equatable.dart';

/// Category entity representing a meal category
class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, description];
}
