import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page/widgets/cart_page_list_tile.dart';
import 'package:grocery_cubit/pages/style/app_typography.dart';

import '../../product.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryCubit, GroceryState>(
      builder: (context, state) {
        final List<Product> favouriteProducts =
            context.read<GroceryCubit>().singleFavProducts;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.of(context).favProducts,
                    style: AppTypography.style1,
                  ),
                  favouriteProducts.isEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('lib/images/empty.jpg'),
                            ),
                            Text(Strings.of(context).noProducts),
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: favouriteProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GroceryListTile(
                                    image: favouriteProducts[index].image,
                                    productName:
                                        favouriteProducts[index].itemName,
                                    remove: () {},
                                    amount: 0,
                                    add: () {},
                                    removeSpecificProduct: () => context
                                        .read<GroceryCubit>()
                                        .removeFromFavourite(
                                            favouriteProducts[index]),
                                    productPrice:
                                        favouriteProducts[index].price,
                                    shouldShow: false);
                              }),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
