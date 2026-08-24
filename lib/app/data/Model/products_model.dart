class ProductModel {
  final String id;
  final String name;
  final double price;
  final double? originalPrice; // if no discount
  final String imagePath;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.imagePath,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null
          ? (json['originalPrice'] as num).toDouble()
          : null,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'originalPrice': originalPrice,
      'imagePath': imagePath,
    };
  }
}
final List<ProductModel> sampleProducts = [
  const ProductModel(
    id: '1',
    name: 'Yakult Green Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/bubblemilktea.png',
  ),
  const ProductModel(
    id: '2',
    name: 'Yakult Green',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/bubblemilktea.png',
  ),
  const ProductModel(
    id: '3',
    name: 'Yakult Green',
    price: 1.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '4',
    name: 'Yakult Green Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/bubblemilktea.png',
  ),
  const ProductModel(
    id: '5',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '6',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '7',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '8',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '9',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '10',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '11',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
  const ProductModel(
    id: '12',
    name: 'Yakult Green Bubble Milk Tea',
    price: 1.00,
    originalPrice: 2.00,
    imagePath: 'assets/images/greentea.png',
  ),
 
];