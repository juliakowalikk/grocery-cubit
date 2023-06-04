import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_cubit/cubit/grocery_cubit.dart';
import 'package:grocery_cubit/cubit/grocery_state.dart';
import 'package:grocery_cubit/pages/cart_page/cart_page.dart';
import 'package:grocery_cubit/pages/favourite_page/favourite_page.dart';
import 'package:grocery_cubit/pages/grocery_page/grocery_page.dart';

List<Widget> bodies = const [
  GroceryPage(),
  CartPage(),
  FavouritePage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryCubit, GroceryState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xFF40C77C),
            currentIndex: currentIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: Strings.of(context).grocery),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label: Strings.of(context).cart),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  label: Strings.of(context).favourite),
            ],
          ),
          body: bodies[currentIndex],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
