import 'package:ex2/core/models/cart_item.dart' show CartItem;
import 'package:ex2/core/models/products.dart' show Product;
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ex2/module/cart/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            SizedBox(width: 10),
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
            Column(
              children: [
                Text(
                  "\$$itemTotal",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().decrease(widget.cartItem);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(widget.cartItem.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().increase(widget.cartItem);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().remove(widget.cartItem);
                      },
                      icon: const Icon(Icons.delete_forever_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
