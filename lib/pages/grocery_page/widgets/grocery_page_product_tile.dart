import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/pages/product_page/product_page.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.m)),
            border: Border.all(color: grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Row(
                children: [
                  Text(Strings.of(context)
                      .productPrice(product.price.toStringAsFixed(2))),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(Dimens.m)),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(product: product)),
                      ),
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
