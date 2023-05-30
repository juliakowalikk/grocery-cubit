import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page/widgets/cart_page_list_tile.dart';
import 'package:grocery_cubit/product.dart';

class CartPageListView extends StatelessWidget {
  const CartPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryCubit, GroceryState>(
      builder: (context, state) {
        final List<Product> singleProducts =
            context.read<GroceryCubit>().singleProducts;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: singleProducts.length,
          itemBuilder: (context, index) {
            final amount = state.cartProducts
                .where((element) => element == singleProducts[index])
                .length;

            return GroceryListTile(
                shouldShow: true,
                image: singleProducts[index].image,
                productName: singleProducts[index].itemName,
                remove: () => context
                    .read<GroceryCubit>()
                    .removeProduct(singleProducts[index]),
                amount: state.cartProducts
                    .where((element) => element == singleProducts[index])
                    .length,
                add: () => context
                    .read<GroceryCubit>()
                    .addToCart(amount, singleProducts[index]),
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
