import 'package:ex2/core/models/products.dart' show Product;

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
