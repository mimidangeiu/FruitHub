import 'package:ex2/common/widget/primary_textfield.dart';
import 'package:ex2/core/data/mock_products.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/home_screen/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category selectedCategory = Category.Hottest;

  List<Product> getProductByCategory(Category category) {
    return products
        .where((product) => product.categories.contains(category))
        .toList();
  }

  void changeCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recommendedProducts = getProductByCategory(Category.Recommended);
    final filteredProducts = getProductByCategory(selectedCategory);

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
            Text(
              "Hello Tony, What fruit salad\ncombo do you want today?",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: PrimaryTextfield(
                    icon: Image.asset('assets/icons/search_icon.png'),
                    hint: "   Search for fruit salad combos",
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
                  return ProductCard(
                    product: recommendedProducts[index],
                    onLike: () {
                      setState(() {
                        recommendedProducts[index].isLiked =
                            !recommendedProducts[index].isLiked;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = Category.Hottest;
                    });
                  },
                  child: Text("Hottest"),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = Category.Popular;
                    });
                  },
                  child: Text("Popular"),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = Category.NewCombo;
                    });
                  },
                  child: Text("New combo"),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = Category.Top;
                    });
                  },
                  child: Text("Top"),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: filteredProducts[index],
                    onLike: () {
                      setState(() {
                        filteredProducts[index].isLiked =
                            !filteredProducts[index].isLiked;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
