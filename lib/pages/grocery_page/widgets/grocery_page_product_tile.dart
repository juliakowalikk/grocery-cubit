import 'package:flutter/material.dart';
import 'package:grocery_cubit/pages/product_page/product_page.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';
import 'package:grocery_cubit/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String price = product.price.toStringAsFixed(2);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          product.image,
          height: 70,
        ),
        Text(
          product.itemName,
          style: AppTypography.style2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Text('\$ $price'),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFCBE8D6),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(
                              product: Product(
                                  itemName: product.itemName,
                                  price: product.price,
                                  image: product.image),
                            ))),
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color(0xFF40C77C),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
