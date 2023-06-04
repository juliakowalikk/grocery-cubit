import 'package:flutter/material.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';
import 'package:grocery_cubit/widgets/product_counter.dart';

class GroceryListTile extends StatelessWidget {
  const GroceryListTile(
      {super.key,
      required this.image,
      required this.productName,
      required this.remove,
      required this.amount,
      required this.add,
      required this.removeSpecificProduct,
      required this.productPrice,
      required this.shouldShow});

  final String image;
  final String productName;
  final Function() remove;
  final int amount;
  final Function() add;
  final Function() removeSpecificProduct;
  final double productPrice;
  final bool shouldShow;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        Text(
                          productName,
                          style: AppTypography.style2,
                        ),
                        Text('\$ ${productPrice.toStringAsFixed(2)}'),
                      ],
                    ),
                    const Spacer(),
                    if (shouldShow)
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
//Color(0xFF40C77C)
// Color(0xFFCBE8D6)
