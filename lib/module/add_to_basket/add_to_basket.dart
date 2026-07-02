import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/common/widget/app_stack.dart';
import 'package:flutter/material.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:ex2/theme/app_theme.dart';
import 'package:ex2/common/widget/app_stack.dart';
import 'package:ex2/common/widget/goback_button.dart';

class AddToBasket extends StatefulWidget {
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
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text("."),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Image.asset('assets/images/add_to_basket_icon.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          "Quinoa Fruit Salad",
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          children: [
                            TextButton(onPressed: () {}, child: Text('.')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
