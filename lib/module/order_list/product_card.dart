import 'package:ex2/core/models/cart_item.dart' show CartItem;
import 'package:ex2/core/models/products.dart' show Product;
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  @override
  final CartItem cartItem;
  ProductCard({required this.cartItem});

  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Widget build(BuildContext context) {
    final itemTotal =
        widget.cartItem.product.price * (widget.cartItem.quantity ?? 0);
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                widget.cartItem.product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  widget.cartItem.product.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.cartItem.quantity ?? 0} packs",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Spacer(),
            Text(
              "\$$itemTotal",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
