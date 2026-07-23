import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/core/models/cart_item.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/module/cart/cubit/cart_cubit.dart';
import 'package:ex2/module/favourite/cubit/favourite_cubit.dart';
import 'package:ex2/module/favourite/cubit/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:ex2/theme/app_theme.dart';
import 'package:ex2/common/widget/app_stack.dart';
import 'package:ex2/common/widget/goback_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBasket extends StatefulWidget {
  final Product product;

  const AddToBasket({required this.product});

  State<AddToBasket> createState() => _AddToBasketState();
}

class _AddToBasketState extends State<AddToBasket> {
  int quantity = 1;
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = widget.product.price * quantity;
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                            widget.product.name,
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
                              Text(quantity.toString()),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: onTappedIncrease,
                                child: Image.asset(
                                  'assets/icons/increase_button.png',
                                ),
                              ),
                              SizedBox(width: 70),
                              Text(
                                "\$ ${totalPrice}",
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
                          widget.product.ingredients,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          widget.product.description,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<FavouriteCubit, FavouriteState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    context
                                        .read<FavouriteCubit>()
                                        .tappedHeart();
                                  },
                                  icon: Image.asset(
                                    state.isLiked
                                        ? 'assets/icons/tapped_heart.png'
                                        : 'assets/icons/untapped_heart.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                );
                              },
                            ),
                            PrimaryButton(
                              onPressed: () {
                                context.read<CartCubit>().addItem(
                                  CartItem(
                                    product: widget.product,
                                    quantity: quantity,
                                  ),
                                );
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
      quantity += 1;
    });
  }

  void onTappedDecrease() {
    setState(() {
      if (quantity > 1) {
        quantity -= 1;
      }
    });
  }
}
