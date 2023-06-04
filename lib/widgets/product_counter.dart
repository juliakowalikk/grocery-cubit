import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter(
      {super.key,
      required this.amountOfProducts,
      required this.increment,
      required this.decrement,
      required this.color});

  final int amountOfProducts;
  final Function() increment;
  final Function() decrement;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
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
