import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';
import 'package:grocery_cubit/widgets/product_counter.dart';

class GroceryListTile extends StatelessWidget {
  final String image;
  final String productName;
  final Function? onRemove;
  final int amount;
  final Function? onAdd;
  final Function onRemoveSpecificProduct;
  final double productPrice;

  const GroceryListTile({
    super.key,
    required this.image,
    required this.productName,
    this.onRemove,
    this.amount = 0,
    this.onAdd,
    required this.onRemoveSpecificProduct,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.xm),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(Dimens.m)),
              border: Border.all(color: grey)),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.m),
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
                        Text(Strings.of(context).productPrice(
                          productPrice.toStringAsFixed(2),
                        )),
                      ],
                    ),
                    const Spacer(),
                    if (onAdd != null && onRemove != null)
                      ProductCounter(
                        amount: amount,
                        onIncrement: onAdd!,
                        onDecrement: onRemove!,
                        color: Colors.white,
                      ),
                    IconButton(
                      onPressed: () => onRemoveSpecificProduct(),
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
