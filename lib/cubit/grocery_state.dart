import 'package:grocery_cubit/product.dart';

abstract class GroceryState {
  final List<Product> cartProducts;
  final List<Product> allProducts;
  final List<Product> favouriteProducts;
  final double totalPrice;

  GroceryState(
    this.cartProducts,
    this.allProducts,
    this.favouriteProducts,
    this.totalPrice,
  );
}

class GroceryInitial extends GroceryState {
  GroceryInitial(
    super.cartProducts,
    super.allProducts,
    super.favouriteProducts,
    super.totalPrice,
  );
}

class GroceryAddedToCart extends GroceryState {
  GroceryAddedToCart(
    super.cartProducts,
    super.allProducts,
    super.favouriteProducts,
    super.totalPrice,
  );
}

class FavouriteGrocery extends GroceryState {
  FavouriteGrocery(
    super.cartProducts,
    super.allProducts,
    super.favouriteProducts,
    super.totalPrice,
  );
}
