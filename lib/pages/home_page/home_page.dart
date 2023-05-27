import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/favourite_page/favourite_page.dart';
import 'package:grocery_cubit/pages/home_page/widgets/home_page_product_tile.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          title: const Text('Grocery Market'),
        ),
        body: BlocBuilder<GroceryCubit, GroceryState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 18),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade100),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FavouritePage()));
                        },
                        child: const Icon(Icons.favorite),
                      ),
                    )
                  ],
                ),
                Text(
                  'Buy your fresh groceries',
                  style: AppTypography.style1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.allProducts.length,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTile(product: state.allProducts[index]),
                        )),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                  ),
                ),
              ],
            );
          },
        ),
      );
}
