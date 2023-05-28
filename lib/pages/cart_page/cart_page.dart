import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page/widgets/cart_page_list_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          title: Text(Strings.of(context).yourCart),
        ),
        body: BlocBuilder<GroceryCubit, GroceryState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CartPageListView(),
                    Text(Strings.of(context)
                        .totalPrice(state.totalPrice.toStringAsFixed(2))),
                    Text(Strings.of(context)
                        .productCount(state.cartProducts.length)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Text(Strings.of(context).buy),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        child: Text(Strings.of(context).delete),
                        onTap: () =>
                            context.read<GroceryCubit>().removeAllProducts(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
