import 'package:ex2/core/models/products.dart';
import 'package:ex2/module/add_to_basket/add_to_basket.dart';
import 'package:ex2/module/authentication/authentication.dart';
import 'package:ex2/module/complete_detail/complete_detail.dart';
import 'package:ex2/module/input_card_details/input_card_details.dart';
import 'package:ex2/module/order_complete/order_complete.dart';
import 'package:ex2/module/order_list/order_list.dart';
import 'package:ex2/module/track_order/track_order.dart';
import 'package:ex2/module/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:ex2/module/splash_screen/splash_screen.dart';
import 'package:ex2/theme/app_theme.dart';

import 'module/home_screen/home_screen.dart';

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          themeMode: themeMode,
          //darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          initialRoute: '/',
          routes: {
            '/splash': (context) => SplashScreen(),
            '/home': (context) => HomeScreen(),
            '/auth': (context) => Authentication(),
            '/complete': (context) => CompleteDetail(),
            '/card': (context) => InputCardDetails(),
            '/success': (context) => OrderComplete(),
            '/order': (context) => OrderList(),
            '/tracking': (context) => TrackOrder(),
            '/': (context) => WelcomeScreen(),
          },
        );
      },
    );
  }
}
