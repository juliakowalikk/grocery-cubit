import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String itemName;
  final double price;

  const Product({
    required this.itemName,
    required this.price,
  });

  @override
  List<Object?> get props => [itemName, price];
}
