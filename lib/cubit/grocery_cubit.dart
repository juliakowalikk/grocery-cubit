import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';
import 'grocery_state.dart';

class GroceryCubit extends Cubit<GroceryState> {
  GroceryCubit()
      : super(GroceryInitial([], [
          const Product(itemName: 'Orange', price: 2.10),
          const Product(itemName: 'Grape', price: 3.45),
          const Product(itemName: 'Banana', price: 1.15),
          const Product(itemName: 'Cherry', price: 4.40),
        ], [], 0));

  final List<Product> cartProducts = [];
  List<Product> get singleProducts => cartProducts.toSet().toList();

  final List<Product> favouriteProducts = [];

  double totalPrice = 0;

  void addToCart(int amount, Product product) {
    cartProducts.addAll(List.generate(amount, (index) => product));
    totalPrice = totalPrice + (product.price * amount);
    emit(GroceryAddedToCart(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
    emit(GroceryInitial(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }

  void removeProduct(Product product) {
    cartProducts.remove(product);
    totalPrice = totalPrice - product.price;
    emit(GroceryInitial(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }

  void removeAllProducts() {
    cartProducts.clear();
    totalPrice = 0;
    emit(GroceryInitial(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }

  void removeSpecificProduct(int amount, Product product) {
    cartProducts.removeWhere((Product item) => product == item);
    totalPrice = totalPrice - (product.price * amount);
    emit(GroceryInitial(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }

  List<Product> get singleFavProducts => favouriteProducts.toSet().toList();

  void addToFavourite(Product product) {
    favouriteProducts.add(product);
    emit(FavouriteGrocery(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }

  void removeFromFavourite(int index) {
    favouriteProducts.removeAt(index);
    emit(GroceryInitial(
        cartProducts, state.allProducts, favouriteProducts, totalPrice));
  }
}
