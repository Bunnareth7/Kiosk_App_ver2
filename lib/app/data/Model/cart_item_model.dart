import 'package:kiosk_app/app/data/Model/products_model.dart';

class CartItemModel {
  final ProductModel product;
  final String cupSizeLabel;
  final String sugarLabel;
  final String iceLabel;
  final List<String> toppingLabels;
  final double unitPrice;
  final int quantity;

  const CartItemModel({
    required this.product,
    required this.cupSizeLabel,
    required this.sugarLabel,
    required this.iceLabel,
    required this.toppingLabels,
    required this.unitPrice,
    required this.quantity,
  });

  double get lineTotal => unitPrice * quantity;
}