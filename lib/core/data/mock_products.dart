import 'package:ex2/core/models/category.dart' show Category;
import 'package:ex2/core/models/products.dart' show Product;

final List<Product> products = [
  Product(
    name: 'Honey lime combo',
    price: 2000,
    imageUrl: 'assets/images/honey_lime_image.png',
    categories: [Category.Recommended],
  ),
  Product(
    name: 'Berry mango combo',
    price: 8000,
    imageUrl: 'assets/images/berry_mango_image.png',
    categories: [Category.Recommended],
  ),

  Product(
    name: 'Quinoa fruit salad',
    price: 10000,
    quantity: 2,
    imageUrl: 'assets/images/quinoa_fruit_image.png',
    categories: [Category.Hottest, Category.Basket],
  ),
  Product(
    name: 'Tropical fruit salad',
    price: 10000,
    quantity: 2,
    imageUrl: 'assets/images/tropical_fruit_image.png',
    categories: [Category.Hottest, Category.Basket],
  ),
  Product(
    name: 'Melon fruit salad',
    price: 10000,
    quantity: 2,
    imageUrl: 'assets/images/melon_fruit_image.png',
    categories: [Category.Hottest, Category.Basket],
  ),
];
