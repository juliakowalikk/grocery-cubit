import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/widgets/grocery_list_tile.dart';

class CartPageListView extends StatelessWidget {
  const CartPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryCubit, GroceryState>(
      builder: (context, state) {
        final List<Product> singleProducts =
            context.read<GroceryCubit>().singleProducts;

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: singleProducts.length,
          itemBuilder: (context, index) {
            final amount = state.cartProducts
                .where((element) => element == singleProducts[index])
                .length;

            return GroceryListTile(
                // TODO lepsza nazwa
                shouldShow: true,
                image: singleProducts[index].image,
                productName: singleProducts[index].itemName,
                // konwencja nazewnictwa funkcji to przeważnie onRemove, onAdd, onCośtam
                remove: () => context
                    .read<GroceryCubit>()
                    .removeProduct(singleProducts[index]),
                amount: amount,
                add: () => context
                    .read<GroceryCubit>()
                    .addProduct(1, singleProducts[index]),
                removeSpecificProduct: () => context
                    .read<GroceryCubit>()
                    .removeSpecificProduct(amount, singleProducts[index]),
                productPrice: singleProducts[index].price);
          },
        );
      },
    );
  }
}
