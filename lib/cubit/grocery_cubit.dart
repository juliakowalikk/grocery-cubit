import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';
import 'grocery_state.dart';

class GroceryCubit extends Cubit<GroceryState> {
  GroceryCubit()
      : super(GroceryInitial([], [
          Product(itemName: 'Orange', price: 2.10),
          Product(itemName: 'Grape', price: 3.45),
          Product(itemName: 'Banana', price: 1.15),
          Product(itemName: 'Cherry', price: 4.40),
        ], 0));

  final List<Product> cartProducts = [];
  List<Product> get singleProducts => cartProducts.toSet().toList();

  double totalPrice = 0;

  void addToCart(int amount, Product product) {
    cartProducts.addAll(List.generate(amount, (index) => product));
    totalPrice = totalPrice + (product.price * amount);

    emit(GroceryAddedToCart(cartProducts, state.allProducts, totalPrice));
    emit(GroceryInitial(cartProducts, state.allProducts, totalPrice));
  }

  void removeProduct(Product product) {
    cartProducts.remove(product);
    totalPrice = totalPrice - product.price;

    emit(GroceryInitial(cartProducts, state.allProducts, totalPrice));
  }

  void removeAllProducts() {
    cartProducts.clear();
    totalPrice = 0;
    emit(GroceryInitial(cartProducts, state.allProducts, totalPrice));
  }

  void removeSpecificProduct(int amount, Product product) {
    // cartProducts.remove(product);
    cartProducts.removeWhere((Product item) => product == item);

    print(cartProducts);
    print(amount);
    totalPrice = totalPrice - (product.price * amount);

    emit(GroceryInitial(cartProducts, state.allProducts, totalPrice));
  }
}
