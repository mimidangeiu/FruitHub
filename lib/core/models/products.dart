import 'category.dart' show Category;

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String ingredients;
  final List<Category> categories;
  final int capacity;
  bool isLiked;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.categories,
    required this.capacity,
    this.isLiked = false,
  });
}
