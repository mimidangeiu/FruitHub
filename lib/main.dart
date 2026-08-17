import 'package:ex2/core/models/products.dart';
import 'package:ex2/core/service/product_service.dart';
import 'package:ex2/injection.dart';
import 'package:ex2/module/add_to_basket/add_to_basket.dart';
import 'package:ex2/module/authentication/authentication.dart';
import 'package:ex2/module/cart/cubit/cart_cubit.dart' show CartCubit;
import 'package:ex2/module/home_screen/cubit/category/category_cubit.dart';
import 'package:ex2/module/complete_detail/complete_detail.dart';
import 'package:ex2/module/input_card_details/input_card_details.dart';
import 'package:ex2/module/order_complete/order_complete.dart';
import 'package:ex2/module/order_list/order_list.dart';
import 'package:ex2/module/order_list/product_card.dart';
import 'package:ex2/module/home_screen/cubit/product/product_cubit.dart';
import 'package:ex2/module/home_screen/cubit/search/search_cubit.dart'
    show SearchCubit;
import 'package:ex2/module/track_order/track_order.dart';
import 'package:ex2/module/user/cubit/usercubit.dart';
import 'package:ex2/module/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:ex2/module/splash_screen/splash_screen.dart';
import 'package:ex2/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/home_screen/view/home_screen.dart';

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

void main() {
  setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(
          create: (_) => ProductCubit(productService: getIt<ProductService>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
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
