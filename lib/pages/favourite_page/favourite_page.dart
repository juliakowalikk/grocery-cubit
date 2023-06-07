import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/product.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';
import 'package:grocery_cubit/widgets/grocery_list_tile.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryCubit, GroceryState>(
      builder: (context, state) {
        final List<Product> favouriteProducts =
            context.read<GroceryCubit>().singleFavProducts;
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(Dimens.xl),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.of(context).favProducts,
                      style: AppTypography.style4,
                    ),
                    favouriteProducts.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.of(context).noProducts,
                                    style: AppTypography.style2,
                                  ),
                                  Text(Strings.of(context).addFav)
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(Dimens.m),
                              itemCount: favouriteProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GroceryListTile(
                                  image: favouriteProducts[index].image,
                                  productName:
                                      favouriteProducts[index].itemName,
                                  onRemoveSpecificProduct: () => context
                                      .read<GroceryCubit>()
                                      .removeFromFavourite(
                                          favouriteProducts[index]),
                                  productPrice: favouriteProducts[index].price),
                            ),
                          ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
