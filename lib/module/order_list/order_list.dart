import 'package:ex2/common/widget/goback_button.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/module/cart/cubit/cart_cubit.dart';
import 'package:ex2/module/cart/cubit/cart_state.dart';
import 'package:ex2/module/complete_detail/complete_detail.dart';
import 'package:ex2/module/order_list/product_card.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final total = state.total;
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().clear();
                        },
                        icon: Icon(Icons.delete_forever),
                      ),
                    ),
                    Text(
                      "Clear all",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                if (state.items.isEmpty) {
                  return Center(
                    child: Text(
                      "Your Basket is empty",
                      style: theme.textTheme.bodyLarge,
                    ),
                  );
                }
                return ProductCard(cartItem: state.items[index]);
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
      },
    );
  }
}
