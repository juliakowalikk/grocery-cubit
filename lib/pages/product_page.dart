import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';
import 'package:grocery_cubit/pages/tiles/product_page_counter.dart';
import 'package:grocery_cubit/product.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    String price = widget.product.price.toStringAsFixed(2);
    return ScaffoldMessenger(
      child: BlocListener<GroceryCubit, GroceryState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Buy ${widget.product.itemName}'),
            backgroundColor: Colors.pink.shade100,
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<GroceryCubit, GroceryState>(
                builder: (context, state) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          widget.product.itemName,
                          style: AppTypography.style1,
                        ),
                        Row(
                          children: [
                            ProductPageCounter(
                              amountOfProducts: amount,
                              increment: () => setState(() => amount++),
                              decrement: () => setState(() => amount--),
                            ),
                            const Spacer(),
                            Text('\$ $price'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade100),
                            onPressed: () {
                              context
                                  .read<GroceryCubit>()
                                  .addToCart(amount, widget.product);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text('Add to Cart'),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade100),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(),
                              )),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Text('Go to Cart'),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  void _listener(BuildContext context, GroceryState state) {
    if (state is GroceryAddedToCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue.shade100,
          content: const Text(
              'The product has been successfully added to the cart!'),
        ),
      );
    }
  }
}
