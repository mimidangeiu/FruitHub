import 'package:dio/dio.dart';

import '../models/category.dart';
import '../models/products.dart';
import '../service/category_service.dart';

class ProductService {
  final dio = Dio();

  Future<List<Product>> getProduct() async {
    try {
      final response = await dio.get('http://10.0.2.2:3001/products');

      if (response.statusCode == 200 && response.data != null) {
        final dynamic raw = response.data;

        final List items = raw is List
            ? raw
            : raw is Map && raw['products'] is List
            ? raw['products']
            : [];

        return items.map((json) {
          final Map<String, dynamic> item = json is Map
              ? Map<String, dynamic>.from(json)
              : {};

          final categoriesRaw = item['categories'] ?? [];
          final categories = categoriesRaw.map<Category>((e) {
            if (e is String) {
              return Category(name: e);
            }
            if (e is Map) {
              return Category(name: e['name'] ?? '');
            }
            return Category(name: '');
          }).toList();

          return Product(
            name: item['name'] ?? '',
            price: item['price'] is num
                ? (item['price'] as num).toDouble()
                : double.tryParse(item['price'].toString()) ?? 0,
            imageUrl: item['imageUrl'] ?? '',
            description: item['description'] ?? '',
            ingredients: item['ingredients'] ?? '',
            categories: categories,
            capacity: item['capacity'] is int
                ? item['capacity']
                : int.tryParse(item['capacity'].toString()) ?? 0,
          );
        }).toList();
      }

      return [];
    } catch (err) {
      print('getProduct error: $err');
      return [];
    }
  }
}
