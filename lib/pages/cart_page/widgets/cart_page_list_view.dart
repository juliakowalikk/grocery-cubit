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
        final List<Product> cartProducts =
            context.read<GroceryCubit>().singleProducts;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: cartProducts.length,
          itemBuilder: (context, index) {
            final amount = cartProducts
                .where((element) => element == cartProducts[index])
                .length;

            return CartListTile(
                image: cartProducts[index].image,
                productName: cartProducts[index].itemName,
                remove: () => context
                    .read<GroceryCubit>()
                    .removeProduct(cartProducts[index]),
                amount: state.cartProducts
                    .where((element) => element == cartProducts[index])
                    .length,
                add: () => context
                    .read<GroceryCubit>()
                    .addToCart(amount, cartProducts[index]),
                removeSpecificProduct: () => context
                    .read<GroceryCubit>()
                    .removeSpecificProduct(amount, cartProducts[index]),
                productPrice: cartProducts[index].price);
          },
        );
      },
    );
  }
}
