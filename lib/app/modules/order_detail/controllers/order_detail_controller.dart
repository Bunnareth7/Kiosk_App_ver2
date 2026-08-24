import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';

class OrderDetailController extends GetxController {
  late final ProductModel product;

  final RxInt selectedCupSizeIndex = 0.obs;
  final RxInt selectedSugarIndex = 0.obs;
  final RxInt selectedIceIndex = 0.obs;
  final RxSet<int> selectedToppingIndexes = <int>{}.obs;
  final RxInt quantity = 1.obs;
  static const List<double> cupSizeExtraPrices = [0, 0.9, 1.8];
  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void selectCupSize(int index) => selectedCupSizeIndex.value = index;
  void selectSugar(int index) => selectedSugarIndex.value = index;
  void selectIce(int index) => selectedIceIndex.value = index;

  void toggleTopping(int index) {
    if (selectedToppingIndexes.contains(index)) {
      selectedToppingIndexes.remove(index);
    } else {
      selectedToppingIndexes.add(index);
    }
    
  }
  void incrementQuantity() => quantity.value++;

  void decrementQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  double get unitPrice =>
      product.price + cupSizeExtraPrices[selectedCupSizeIndex.value];

  double get subtotal => unitPrice * quantity.value;

  
}



