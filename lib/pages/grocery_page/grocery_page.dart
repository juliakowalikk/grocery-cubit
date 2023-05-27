import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/grocery_page/widgets/grocery_page_product_tile.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({
    super.key,
  });

  @override
  State<GroceryPage> createState() => _HomePageState();
}

class _HomePageState extends State<GroceryPage> {
  @override
  Widget build(BuildContext context) => BlocBuilder<GroceryCubit, GroceryState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
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
            ),
          );
        },
      );
}
