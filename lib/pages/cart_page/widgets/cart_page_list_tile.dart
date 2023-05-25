import 'package:flutter/material.dart';
import 'package:grocery_cubit/widgets/product_page_counter.dart';

class CartListTile extends StatelessWidget {
  const CartListTile(
      {super.key,
      required this.productName,
      required this.remove,
      required this.amount,
      required this.add,
      required this.removeSpecificProduct,
      required this.productPrice});
  final String productName;
  final Function() remove;
  final int amount;
  final Function() add;
  final Function() removeSpecificProduct;
  final double productPrice;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(productName),
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
            Text('\$ ${productPrice.toStringAsFixed(2)}'),
          ],
        ),
      );
}
