import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/style/dimens.dart';
import 'package:grocery_cubit/widgets/grocery_list_tile.dart';

class CartPageListView extends StatelessWidget {
  const CartPageListView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<GroceryCubit, GroceryState>(
        builder: (context, state) {
          final List<Product> singleProducts =
              context.read<GroceryCubit>().singleProducts;

          return ListView.builder(
            padding: const EdgeInsets.all(Dimens.m),
            shrinkWrap: true,
            itemCount: singleProducts.length,
            itemBuilder: (context, index) {
              final Product product = singleProducts[index];
              final amount = state.cartProducts
                  .where((element) => element == product)
                  .length;

              return GroceryListTile(
                image: product.image,
                productName: product.itemName,
                onRemove: () =>
                    context.read<GroceryCubit>().removeProduct(product),
                amount: amount,
                onAdd: () =>
                    context.read<GroceryCubit>().addProduct(1, product),
                onRemoveSpecificProduct: () => context
                    .read<GroceryCubit>()
                    .removeSpecificProduct(amount, product),
                productPrice: product.price,
              );
            },
          );
        },
      );
}
