import 'dart:math';

import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/theme/app_text_styles.dart';
import 'package:ex2/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: AppContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Image.asset(
                'assets/icons/splash_screen_icon.png',
                height: 200,
                width: 180,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Text(
                "Fruit Hub",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'BadScript-Regular',
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Navigator.pushNamed(context, '/welcome');
  }
}
