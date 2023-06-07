import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/grocery_page/widgets/grocery_page_product_tile.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<GroceryCubit, GroceryState>(
        builder: (context, state) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.xl),
                child: Text(
                  Strings.of(context).buyGroceries,
                  style: AppTypography.style4,
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.all(Dimens.xm),
                shrinkWrap: true,
                itemCount: state.allProducts.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(Dimens.xm),
                  child: ProductTile(product: state.allProducts[index]),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ],
          ),
        ),
      );
}
