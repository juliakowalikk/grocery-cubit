import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';
import 'package:grocery_cubit/widgets/button.dart';
import 'package:grocery_cubit/widgets/product_counter.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int amount = 1;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: BlocListener<GroceryCubit, GroceryState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: BlocBuilder<GroceryCubit, GroceryState>(
            builder: (context, state) => SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                          ),
                          Text(
                            Strings.of(context).detailItem,
                            style: AppTypography.style4,
                          ),
                        ],
                      ),
                      Image.asset(widget.product.image),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.product.itemName,
                            style: AppTypography.style1,
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<GroceryCubit>()
                                  .addToFavourite(widget.product);
                              setState(() => isFavourite = !isFavourite);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavourite ? pink : darkGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ProductCounter(
                            amount: amount,
                            onIncrement: () => setState(() => amount++),
                            onDecrement: () => setState(() {
                              if (amount > 1) amount--;
                            }),
                            color: lightGreen,
                          ),
                          const Spacer(),
                          Text(Strings.of(context)
                              .productPrice(widget.product.price)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimens.xxl),
                        child: Button(
                          title: Strings.of(context).addToCart,
                          onPressed: () => context
                              .read<GroceryCubit>()
                              .addProduct(amount, widget.product),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, GroceryState state) {
    if (state is GroceryAddedToCart) {
      showSnackBar(
          context, 'The product has been successfully added to the cart!');
    } else if (state is FavouriteGrocery) {
      showSnackBar(context, 'You added this product to favourite!');
    }
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: lightGreen,
        content: Text(message),
      ),
    );
  }
}
