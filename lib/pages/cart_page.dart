import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/tiles/cart_page_list_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          title: const Text('Your Cart'),
        ),
        body: BlocBuilder<GroceryCubit, GroceryState>(
          builder: (context, state) {
            return Column(
              children: [
                const CartPageListView(),
                Text('Total price: \$ ${state.totalPrice.toStringAsFixed(2)}'),
                Text(
                    'You have ${state.cartProducts.length} items in your cart'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text('Buy'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    child: const Text('Delete all'),
                    onTap: () =>
                        context.read<GroceryCubit>().removeAllProducts(),
                  ),
                )
              ],
            );
          },
        ),
      );
}
