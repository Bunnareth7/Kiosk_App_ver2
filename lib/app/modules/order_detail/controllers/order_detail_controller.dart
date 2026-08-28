import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';

class OrderDetailController extends GetxController {
  late final ProductModel product;
  late final CartDao cartDao;

  final RxInt selectedCupSizeIndex = 0.obs;
  final RxInt selectedSugarIndex = 0.obs;
  final RxInt selectedIceIndex = 0.obs;
  final RxSet<int> selectedToppingIndexes = <int>{}.obs;
  final RxInt quantity = 1.obs;

  static const List<double> cupSizeExtraPrices = [0, 0.9, 1.8];

  // Option labels
  static const List<String> cupSizes = ['S', 'M', 'L'];

  static const List<String> sugarLevels = ['0%', '25%', '50%', '75%', '100%'];

  static const List<String> iceLevels = [
    'No Ice',
    'Less Ice',
    'Normal Ice',
    'Extra Ice',
  ];

  @override
  void onInit() {
    super.onInit();

    product = Get.arguments as ProductModel;

    final database = Get.find<AppDatabase>();
    cartDao = CartDao(database);
  }

  void selectCupSize(int index) {
    selectedCupSizeIndex.value = index;
  }

  void selectSugar(int index) {
    selectedSugarIndex.value = index;
  }

  void selectIce(int index) {
    selectedIceIndex.value = index;
  }

  void toggleTopping(int index) {
    if (selectedToppingIndexes.contains(index)) {
      selectedToppingIndexes.remove(index);
    } else {
      selectedToppingIndexes.add(index);
    }
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  double get unitPrice =>
      product.price + cupSizeExtraPrices[selectedCupSizeIndex.value];

  double get subtotal => unitPrice * quantity.value;

  Future<void> addToCart() async {
    final cupSize = cupSizes[selectedCupSizeIndex.value];

    final sugarLevel = sugarLevels[selectedSugarIndex.value];

    final iceLevel = iceLevels[selectedIceIndex.value];

    final toppings = selectedToppingIndexes
        .map((index) => index.toString())
        .join(',');

    await cartDao.addToCart(
      productId: product.id,
      productName: product.name,
      price: unitPrice,
      image: product.imagePath,
      quantity: quantity.value,
      cupSize: cupSize,
      sugarLevel: sugarLevel,
      iceLevel: iceLevel,
      toppings: toppings,
    );
  }
}
