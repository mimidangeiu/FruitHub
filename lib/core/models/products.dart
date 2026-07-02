import 'category.dart' show Category;

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final int? quantity;
  final List<Category> categories;
  bool isLiked;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity,
    required this.categories,
    this.isLiked = false,
  });
}
