import 'package:ex2/common/widget/primary_textfield.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/add_to_basket/add_to_basket.dart';
import 'package:ex2/module/category/cubit/category_cubit.dart';
import 'package:ex2/module/category/cubit/category_state.dart';
import 'package:ex2/module/favourite/cubit/favourite_cubit.dart';
import 'package:ex2/module/home_screen/product_card.dart';
import 'package:ex2/module/product/cubit/product_cubit.dart';
import 'package:ex2/module/search/cubit/search_cubit.dart';
import 'package:ex2/module/search/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ex2/module/user/cubit/usercubit.dart';
import 'package:ex2/module/user/cubit/userstate.dart';

class HomeScreen extends StatefulWidget {
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> getProductByCategory(
    List<Product> products,
    Category category,
  ) {
    return products
        .where((product) => product.categories.contains(category))
        .toList();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final keyword = context.watch<SearchCubit>().state.keyword;
    final products = context.watch<ProductCubit>().state.products;
    final recommendedProducts =
        getProductByCategory(products, Category.Recommended)
            .where(
              (product) =>
                  product.name.toLowerCase().contains(keyword.toLowerCase()),
            )
            .toList();

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
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return Text(
                      "Hello ${state.name}, What fruit salad\ncombo do you want today?",
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
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedProducts.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                        create: (_) =>
                            FavouriteCubit(recommendedProducts[index]),
                        child: ProductCard(product: recommendedProducts[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().uploadCategory(
                          Category.Hottest,
                        );
                      },
                      child: Text("Hottest"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().uploadCategory(
                          Category.Popular,
                        );
                      },
                      child: Text("Popular"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().uploadCategory(
                          Category.NewCombo,
                        );
                      },
                      child: Text("New combo"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().uploadCategory(
                          Category.Top,
                        );
                      },
                      child: Text("Top"),
                    ),
                  ],
                ),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: ((context, state) {
                    final filteredProducts =
                        getProductByCategory(products, state.category)
                            .where(
                              (product) => product.name.toLowerCase().contains(
                                keyword.toLowerCase(),
                              ),
                            )
                            .toList();
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return BlocProvider(
                            create: (_) =>
                                FavouriteCubit(filteredProducts[index]),
                            child: ProductCard(
                              product: filteredProducts[index],
                            ),
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
