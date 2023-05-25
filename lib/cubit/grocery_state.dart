import 'package:grocery_cubit/product.dart';

abstract class GroceryState {
  final List<Product> cartProducts;
  final List<Product> allProducts;
  final double totalPrice;

  GroceryState(
    this.cartProducts,
    this.allProducts,
    this.totalPrice,
  );
}

class GroceryInitial extends GroceryState {
  GroceryInitial(
    super.cartProducts,
    super.allProducts,
    super.totalPrice,
  );
}

class GroceryAddedToCart extends GroceryState {
  GroceryAddedToCart(super.cartProducts, super.allProducts, super.totalPrice);
}
