import 'package:flutter/material.dart';

class ProductPageCounter extends StatelessWidget {
  const ProductPageCounter(
      {super.key,
      required this.amountOfProducts,
      required this.increment,
      required this.decrement});

  final int amountOfProducts;
  final Function() increment;
  final Function() decrement;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Colors.pink.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: () => decrement(),
                icon: const Icon(Icons.remove),
              ),
            ),
            Text('$amountOfProducts'),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: () => increment(),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
}
