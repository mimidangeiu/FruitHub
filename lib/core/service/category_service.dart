import 'package:ex2/core/models/category.dart';

class CategoryService {
  List<Category> getCategory() {
    return [
      Category(name: 'Popular'),
      Category(name: 'Hottest'),
      Category(name: 'Recommended'),
      Category(name: 'Basket'),
      Category(name: 'New Combo'),
      Category(name: 'Top'),
    ];
  }
}
