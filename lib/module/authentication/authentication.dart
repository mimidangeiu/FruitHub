import 'package:ex2/common/widget/primary_textfield.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../common/widget/app_stack.dart';
import '../../common/widget/primary_button.dart';

class Authentication extends StatefulWidget {
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
            Image.asset('assets/images/authentication_icon.png'),
            SizedBox(height: 10),
            Image.asset('assets/images/shade_authentication_icon.png'),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is your firstname?",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            PrimaryTextfield(hint: 'Tony'),
            SizedBox(height: 40),
            PrimaryButton(
              onPressed: onClicked,
              textButton: 'Start Ordering',
              textColor: Colors.white,
              color: AppColors.primaryOrange,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void onClicked() {
    Navigator.pushNamed(context, '/home');
  }
}
