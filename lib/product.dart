import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String itemName;
  final double price;

  Product({
    required this.itemName,
    required this.price,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [itemName, price];
}
