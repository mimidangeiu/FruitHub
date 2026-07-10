import 'package:ex2/core/models/cart_item.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/module/add_to_basket/add_to_basket.dart';
import 'package:ex2/theme/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';

import '../../core/data/mock_products.dart' show products;

class ProductCard extends StatefulWidget {
  final Product product;
  final void Function() onLike;
  const ProductCard({super.key, required this.product, required this.onLike});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: widget.onLike,
                icon: Image.asset(
                  widget.product.isLiked
                      ? 'assets/icons/tapped_heart.png'
                      : 'assets/icons/untapped_heart.png',
                  height: 16,
                ),
              ),
            ],
          ),
          Image.asset(widget.product.imageUrl, height: 100),
          Text(widget.product.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${widget.product.price}"),
              IconButton(
                color: AppColors.backgroundOrange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToBasket(
                        cartItem: CartItem(product: widget.product),
                      ),
                    ),
                  );
                },
                icon: Image.asset('assets/icons/plus_icon.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
