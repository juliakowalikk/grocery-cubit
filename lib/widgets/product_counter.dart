import 'package:flutter/material.dart';
import 'package:grocery_cubit/style/dimens.dart';

class ProductCounter extends StatelessWidget {
  final int amount;
  final Function onIncrement;
  final Function onDecrement;
  final Color color;

  const ProductCounter({
    super.key,
    required this.amount,
    required this.onIncrement,
    required this.onDecrement,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.m)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.s),
              child: IconButton(
                onPressed: () => onDecrement(),
                icon: const Icon(Icons.remove),
              ),
            ),
            Text('$amount'),
            Padding(
              padding: const EdgeInsets.all(Dimens.s),
              child: IconButton(
                onPressed: () => onIncrement(),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
}
