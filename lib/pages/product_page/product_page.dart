import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/widgets/buttons.dart';
import 'package:grocery_cubit/widgets/product_counter.dart';

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
          backgroundColor: Colors.white,
          body: BlocBuilder<GroceryCubit, GroceryState>(
            builder: (context, state) {
              return SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                )),
                            Text(
                              Strings.of(context).detailItem,
                              style: AppTypography.style4,
                            ),
                          ],
                        ),
                        Image.asset(widget.product.image),
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
                                            price: widget.product.price,
                                            image: widget.product.image),
                                      );
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
                              color: const Color(0xFFCBE8D6),
                            ),
                            const Spacer(),
                            Text('\$ $price'),
                          ],
                        ),
                        const Spacer(),
                        Button(
                          title: Strings.of(context).addToCart,
                          onPressed: () => context
                              .read<GroceryCubit>()
                              .addProduct(amount, widget.product),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
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
