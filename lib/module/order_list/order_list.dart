import 'package:ex2/common/widget/goback_button.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/core/data/mock_products.dart';
import 'package:ex2/core/models/products.dart' show Product;
import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/order_list/product_card.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  Widget build(BuildContext context) {
    final basketProducts = products
        .where((product) => product.categories.contains(Category.Basket))
        .toList();
    final total = basketProducts.fold(
      0.0,
      (sum, product) => sum + product.price * (product.quantity ?? 0),
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
          itemCount: basketProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(product: basketProducts[index]);
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
                Navigator.pushNamed(context, '/complete');
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
