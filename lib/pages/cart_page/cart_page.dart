import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page/widgets/cart_page_list_view.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';
import 'package:grocery_cubit/widgets/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<GroceryCubit, GroceryState>(
          builder: (context, state) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.xl),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.of(context).yourCart,
                      style: AppTypography.style4,
                    ),
                    const CartPageListView(),
                    state.cartProducts.isEmpty
                        ? Center(
                            child: Column(children: [
                              Image.asset('lib/images/empty_cart.png'),
                              Text(
                                Strings.of(context).emptyCart,
                                style: AppTypography.style2,
                              ),
                              Text(Strings.of(context).emptySubtitle)
                            ]),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  Strings.of(context).totalPrice(
                                      state.totalPrice.toStringAsFixed(2)),
                                  style: AppTypography.style2,
                                ),
                                Text(Strings.of(context)
                                    .productCount(state.cartProducts.length)),
                                Button(
                                  title: Strings.of(context).buy,
                                  onPressed: () {},
                                  // fake buy button
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(Dimens.xl),
                                  child: InkWell(
                                    child: Text(
                                      Strings.of(context).delete,
                                      style: AppTypography.style3,
                                    ),
                                    onTap: () => context
                                        .read<GroceryCubit>()
                                        .removeAllProducts(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ]),
            ),
          ),
        ),
      );
}
