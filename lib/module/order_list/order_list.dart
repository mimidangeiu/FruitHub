import 'package:ex2/common/widget/goback_button.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/core/data/mock_products.dart';
import 'package:ex2/core/models/cart_item.dart';
import 'package:ex2/core/models/products.dart' show Product;
import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/complete_detail/complete_detail.dart';
import 'package:ex2/module/order_list/product_card.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<CartItem> orderList = [
    CartItem(
      product: Product(
        name: 'Honey lime combo',
        price: 2000,
        imageUrl: 'assets/images/honey_lime_image.png',
        categories: [Category.Recommended],
        capacity: 10,
        ingredients: 'Honey, Fresh lime, Seasonal fruits, Mint leaves.',
        description:
            'A refreshing combination of sweet honey and zesty lime paired with fresh fruits. This light and healthy fruit combo is perfect for breakfast, brunch, or a refreshing snack.',
      ),
      quantity: 2,
    ),
    CartItem(
      product: Product(
        name: 'Berry mango combo',
        price: 8000,
        imageUrl: 'assets/images/berry_mango_image.png',
        categories: [Category.Recommended],
        capacity: 10,
        ingredients: 'Blueberries, Strawberries, Mango, Honey, Fresh mint.',
        description:
            'A colorful blend of juicy berries and sweet mango finished with a touch of honey. Enjoy this delicious combo as a nutritious treat any time of the day.',
      ),
      quantity: 2,
    ),
    CartItem(
      product: Product(
        name: 'Quinoa fruit salad',
        price: 10000,
        imageUrl: 'assets/images/quinoa_fruit_image.png',
        categories: [Category.Hottest, Category.Basket],
        capacity: 10,
        ingredients:
            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
        description:
            'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you',
      ),
      quantity: 2,
    ),
  ];
  Widget build(BuildContext context) {
    final total = orderList.fold(
      0.0,
      (sum, cartItem) =>
          sum + cartItem.product.price * (cartItem.quantity ?? 0),
    );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 120,
        leading: GobackButton(navigator: '/home'),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "My Basket",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return ProductCard(cartItem: orderList[index]);
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Total",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "\$$total",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            PrimaryButton(
              width: 200,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return CompleteDetail();
                  },
                );
              },
              textButton: "Checkout",
              color: AppColors.primaryOrange,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
