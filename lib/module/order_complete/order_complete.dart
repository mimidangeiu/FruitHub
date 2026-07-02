import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/common/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:ex2/theme/app_theme.dart';

class OrderComplete extends StatefulWidget {
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme = theme.colorScheme;

    return Scaffold(
      body: AppContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 164,
                    height: 164,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.successBorder,
                      border: Border.all(color: AppColors.success, width: 2),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.success,
                    ),
                  ),
                  Image.asset('assets/icons/success_icon.png'),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text("Congratulations!!!", style: theme.textTheme.headlineLarge),
            SizedBox(height: 20),
            Text(
              "Your order have been taken and\nis being attended to",
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            PrimaryButton(
              width: 200,
              onPressed: () {
                Navigator.pushNamed(context, '/tracking');
              },
              color: AppColors.primaryOrange,
              textColor: Colors.white,
              textButton: 'Track order',
            ),
            SizedBox(height: 60),
            PrimaryButton(
              width: 250,
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              color: Colors.white,
              textColor: AppColors.primaryOrange,
              textButton: 'Continue shopping',
            ),
            SizedBox(height: 130),
          ],
        ),
      ),
    );
  }
}
