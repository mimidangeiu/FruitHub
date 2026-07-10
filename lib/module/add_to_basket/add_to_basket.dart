import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/common/widget/app_stack.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/core/models/cart_item.dart';
import 'package:ex2/core/models/products.dart';
import 'package:flutter/material.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:ex2/theme/app_theme.dart';
import 'package:ex2/common/widget/app_stack.dart';
import 'package:ex2/common/widget/goback_button.dart';

class AddToBasket extends StatefulWidget {
  final CartItem cartItem;
  const AddToBasket({required this.cartItem});

  State<AddToBasket> createState() => _AddToBasketState();
}

class _AddToBasketState extends State<AddToBasket> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.primaryOrange)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: GobackButton(navigator: '/home'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                child: Image.asset('assets/images/add_to_basket_icon.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Text(
                            textAlign: TextAlign.left,
                            widget.cartItem.product.name,
                            style: theme.textTheme.headlineLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: onTappedDecrease,
                                child: Image.asset(
                                  'assets/icons/decrease_button.png',
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(widget.cartItem.quantity.toString()),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: onTappedIncrease,
                                child: Image.asset(
                                  'assets/icons/increase_button.png',
                                ),
                              ),
                              SizedBox(width: 70),
                              Text(
                                "\$ ${widget.cartItem.product.price}",
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          "One Pack Contains:",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset('assets/icons/addtobasket_line.png'),
                        SizedBox(height: 30),
                        Text(
                          widget.cartItem.product.ingredients,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          widget.cartItem.product.description,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.cartItem.product.isLiked =
                                      !widget.cartItem.product.isLiked;
                                });
                              },
                              icon: Image.asset(
                                widget.cartItem.product.isLiked
                                    ? 'assets/icons/tapped_heart.png'
                                    : 'assets/icons/untapped_heart.png',
                                height: 16,
                                width: 16,
                              ),
                            ),
                            PrimaryButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/order');
                              },
                              width: 200,
                              textButton: 'Add to Basket',
                              color: AppColors.primaryOrange,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onTappedIncrease() {
    setState(() {
      widget.cartItem.quantity = widget.cartItem.quantity++;
    });
  }

  void onTappedDecrease() {
    setState(() {
      widget.cartItem.quantity = widget.cartItem.quantity--;
    });
  }
}
