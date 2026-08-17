import 'dart:async';

import 'package:ex2/common/widget/primary_textfield.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/add_to_basket/add_to_basket.dart';
import 'package:ex2/module/authentication/cubit/auth_cubit.dart';
import 'package:ex2/module/authentication/cubit/auth_state.dart';
import 'package:ex2/module/home_screen/cubit/category/category_cubit.dart';
import 'package:ex2/module/home_screen/cubit/category/category_state.dart';
import 'package:ex2/module/favourite/cubit/favourite_cubit.dart';
import 'package:ex2/module/home_screen/view/product_card.dart';
import 'package:ex2/module/home_screen/cubit/product/product_cubit.dart';
import 'package:ex2/module/home_screen/cubit/search/search_cubit.dart';
import 'package:ex2/module/home_screen/cubit/search/search_state.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product/product_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final selectedCategory = context.read<CategoryCubit>().getCategories();
    // call loadProducts once on enter
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().loadProducts();
    });
  }

  Widget build(BuildContext context) {
    final selectedCategory = context.read<CategoryCubit>().getCategories();
    context.read<ProductCubit>().getProduct(selectedCategory);
    final theme = Theme.of(context);
    final keyword = context.watch<SearchCubit>().state.keyword;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/dropdown_icon.png',
                        height: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/order');
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/shopping-basket.png',
                            height: 24,
                            width: 24,
                          ),
                          Text("My Basket", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Text(
                      "Hello ${(state as AuthAuthenticated).firstName}, What fruit salad\ncombo do you want today?",
                      style: theme.textTheme.bodyLarge,
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: PrimaryTextfield(
                        icon: Image.asset('assets/icons/search_icon.png'),
                        hint: "   Search for fruit salad combos",
                        onChanged: (value) {
                          context.read<SearchCubit>().search(value);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/filters_icon.png'),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                Text(
                  "Recommended Combo",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const SizedBox(
                        height: 250,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state.errorMessage != null) {
                      return SizedBox(
                        height: 250,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.wifi_off, size: 48),
                              const SizedBox(height: 12),
                              Text(
                                state.errorMessage!,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<ProductCubit>().loadProducts(),
                                child: const Text('Thử lại'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    final searchKeyword = keyword.trim().toLowerCase();

                    final recommendedProducts = searchKeyword.isEmpty
                        ? state.recommendedProducts
                        : state.recommendedProducts.where((product) {
                            return product.name.toLowerCase().contains(
                                  searchKeyword,
                                ) ||
                                product.ingredients.toLowerCase().contains(
                                  searchKeyword,
                                ) ||
                                product.description.toLowerCase().contains(
                                  searchKeyword,
                                );
                          }).toList();
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedProducts.length,
                        itemBuilder: (context, index) {
                          return BlocProvider(
                            create: (_) =>
                                FavouriteCubit(recommendedProducts[index]),
                            child: ProductCard(
                              product: recommendedProducts[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),

                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.categories.map((item) {
                          final isSelected =
                              state.selectedCategory?.name == item.name;

                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                context.read<CategoryCubit>().selectedCategory(
                                  item,
                                );
                                context.read<ProductCubit>().filteredProduct(
                                  item,
                                );
                              },
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),

                BlocBuilder<ProductCubit, ProductState>(
                  builder: ((context, state) {
                    final searchKeyword = keyword.trim().toLowerCase();

                    final products = searchKeyword.isEmpty
                        ? state.products
                        : state.products.where((product) {
                            return product.name.toLowerCase().contains(
                              searchKeyword,
                            );
                          }).toList();

                    if (products.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Text(
                          'No products found',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return BlocProvider(
                            create: (_) => FavouriteCubit(products[index]),
                            child: ProductCard(product: products[index]),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
