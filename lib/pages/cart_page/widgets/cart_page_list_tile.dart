import 'package:flutter/material.dart';
import 'package:grocery_cubit/widgets/product_page_counter.dart';

class CartListTile extends StatelessWidget {
  const CartListTile(
      {super.key,
      required this.image,
      required this.productName,
      required this.remove,
      required this.amount,
      required this.add,
      required this.removeSpecificProduct,
      required this.productPrice});

  final String image;
  final String productName;
  final Function() remove;
  final int amount;
  final Function() add;
  final Function() removeSpecificProduct;
  final double productPrice;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      height: 70,
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productName),
                        Text('\$ ${productPrice.toStringAsFixed(2)}'),
                      ],
                    ),
                    const Spacer(),
                    ProductCounter(
                        amountOfProducts: amount,
                        increment: add,
                        decrement: remove,
                        color: Colors.white),
                    IconButton(
                      onPressed: () => removeSpecificProduct(),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
