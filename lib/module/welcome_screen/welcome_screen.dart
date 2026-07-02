import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ex2/common/widget/app_stack.dart';

class WelcomeScreen extends StatefulWidget {
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AppStack(
        hero: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Align(
              child: Image.asset(
                'assets/images/fly_icon.png',
                alignment: AlignmentGeometry.centerLeft,
              ),
            ),
            Image.asset('assets/images/welcome_icon.png', height: 300),
            SizedBox(height: 10),
            Image.asset('assets/images/shade_welcome_icon.png'),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get The Freshest Fruit Salad Combo",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            SizedBox(height: 70),
            PrimaryButton(
              onPressed: onClicked,
              textColor: Colors.white,
              color: AppColors.primaryOrange,
              textButton: 'Let’s Continue',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void onClicked() {
    Navigator.pushNamed(context, '/auth');
  }
}
