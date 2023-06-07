import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String itemName;
  final double price;
  final String image;

  const Product({
    required this.itemName,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [itemName, price, image];
}
