import 'package:flutter/material.dart';

class ProductPageButtons extends StatelessWidget {
  const ProductPageButtons(
      {super.key,
      required this.addToCart,
      required this.addText,
      required this.goToCart,
      required this.goText});
  final Function() addToCart;
  final String addText;
  final Function() goToCart;
  final String goText;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100),
              onPressed: () {
                addToCart();
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(addText),
              ),
            ),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
            onPressed: () => goToCart(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(goText),
            ),
          )
        ],
      );
}
