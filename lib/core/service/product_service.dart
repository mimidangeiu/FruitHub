import '../models/category.dart';
import '../models/products.dart';
import '../service/category_service.dart';

class ProductService {
  List<Product> getProduct() {
    return [
      Product(
        name: 'Honey lime combo',
        price: 2000,
        imageUrl: 'assets/images/honey_lime_image.png',
        categories: [Category(name: 'Recommended')],
        capacity: 10,
        ingredients: 'Honey, Fresh lime, Seasonal fruits, Mint leaves.',
        description:
            'A refreshing combination of sweet honey and zesty lime paired with fresh fruits. This light and healthy fruit combo is perfect for breakfast, brunch, or a refreshing snack.',
      ),
      Product(
        name: 'Berry mango combo',
        price: 8000,
        imageUrl: 'assets/images/berry_mango_image.png',
        categories: [Category(name: 'Recommended')],
        capacity: 10,
        ingredients: 'Blueberries, Strawberries, Mango, Honey, Fresh mint.',
        description:
            'A colorful blend of juicy berries and sweet mango finished with a touch of honey. Enjoy this delicious combo as a nutritious treat any time of the day.',
      ),

      Product(
        name: 'Quinoa fruit salad',
        price: 10000,
        imageUrl: 'assets/images/quinoa_fruit_image.png',
        categories: [
          Category(name: 'Hottest'),
          Category(name: 'Basket'),
        ],
        capacity: 10,
        ingredients:
            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
        description:
            'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you',
      ),
      Product(
        name: 'Tropical fruit salad',
        price: 10000,
        imageUrl: 'assets/images/tropical_fruit_image.png',
        categories: [
          Category(name: 'Hottest'),
          Category(name: 'Basket'),
        ],
        capacity: 10,
        ingredients: 'Pineapple, Mango, Kiwi, Papaya, Orange, Fresh mint.',
        description:
            'Bring the taste of the tropics to your table with this vibrant fruit salad. Packed with fresh tropical fruits, it\'s a naturally sweet and energizing choice for any occasion.',
      ),
      Product(
        name: 'Melon fruit salad',
        price: 10000,
        imageUrl: 'assets/images/melon_fruit_image.png',
        categories: [
          Category(name: 'Popular'),
          Category(name: 'Basket'),
        ],
        capacity: 10,
        ingredients:
            'Watermelon, Cantaloupe, Honeydew melon, Fresh mint, Lime juice.',
        description:
            'A cool and refreshing mix of juicy melons with a hint of lime and fresh mint. This hydrating fruit salad is perfect for warm days and healthy snacking.',
      ),
    ];
  }
}
