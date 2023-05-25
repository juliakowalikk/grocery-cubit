import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(productName),
                  const Spacer(),
                  IconButton(
                    onPressed: () => remove(),
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$amount'),
                  IconButton(
                    onPressed: () => add(),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () => removeSpecificProduct(),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              Text('\$ ${productPrice.toStringAsFixed(2)}'),
            ],
          ),
        ),
      );
}
