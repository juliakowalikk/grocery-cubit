import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/home_page/home_page.dart';
import 'package:grocery_cubit/pages/product_page/widgets/product_page_buttons.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/widgets/product_page_counter.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int amount = 1;
  bool isPressed = false;

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.itemName,
                              style: AppTypography.style1,
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<GroceryCubit>().addToFavourite(
                                      Product(
                                          itemName: widget.product.itemName,
                                          price: widget.product.price));
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                },
                                icon: Icon(Icons.favorite,
                                    color:
                                        isPressed ? Colors.pink : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            ProductCounter(
                              amountOfProducts: amount,
                              increment: () => setState(
                                () => amount++,
                              ),
                              decrement: () => setState(() {
                                amount--;
                                amount = max(amount - 1, 0);
                              }),
                              color: Colors.pink.shade100,
                            ),
                            const Spacer(),
                            Text('\$ $price'),
                          ],
                        ),
                        ProductPageButtons(
                            addToCart: () => context
                                .read<GroceryCubit>()
                                .addToCart(amount, widget.product),
                            addText: 'Add to Cart',
                            goToCart: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage())),
                            goText: 'Go to Cart'),
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
    } else if (state is FavouriteGrocery) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue.shade100,
          content: const Text('You added this product to favourite!'),
        ),
      );
    }
  }
}
