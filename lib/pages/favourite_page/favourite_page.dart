import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';

import '../../product.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> favouriteProducts =
        context.read<GroceryCubit>().singleFavProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Favourite products',
              style: AppTypography.style1,
            ),
            BlocBuilder<GroceryCubit, GroceryState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.favouriteProducts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(favouriteProducts[index].itemName),
                          subtitle: Text(
                              '\$ ${favouriteProducts[index].price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                              onPressed: () {
                                context
                                    .read<GroceryCubit>()
                                    .removeFromFavourite(index);
                              },
                              icon: const Icon(Icons.remove)),
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
