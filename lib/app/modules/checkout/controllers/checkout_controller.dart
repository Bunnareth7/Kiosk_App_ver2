import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';

class CheckoutController extends GetxController {
  late final CartDao cartDao;

  // =========================
  // TIP
  // =========================

  // 0 = No Tip
  // 1 = 10%
  // 2 = 15%
  // 3 = 20%
  // 4 = Custom
  final RxInt selectedTipIndex = 0.obs;

  static const List<double> tipPercentages = [
    0.0,
    0.10,
    0.15,
    0.20,
    0.0,
  ];

  final RxDouble customTip = 0.0.obs;

  // =========================
  // CHECKOUT CHARGES
  // =========================

  // We can change these later when the real
  // discount/service charge logic is ready.
  final RxDouble discount = 0.0.obs;
  final RxDouble serviceCharge = 1.0.obs;

  // Display VAT percentage
  final double vatPercentage = 10.0;

  @override
  void onInit() {
    super.onInit();

    final database = Get.find<AppDatabase>();
    cartDao = CartDao(database);
  }

  // =========================
  // CART
  // =========================

  Stream<List<CartItem>> get cartItems {
    return cartDao.watchCartItems();
  }

  Stream<double> get subtotal {
    return cartDao
        .watchCartSummary()
        .map((summary) => summary.totalPrice);
  }

  Stream<int> get totalQuantity {
    return cartDao
        .watchCartSummary()
        .map((summary) => summary.quantity);
  }

  Future<void> deleteCartItem(int id) async {
    await cartDao.deleteCartItem(id);
  }

  // =========================
  // TIP
  // =========================

  void selectTip(int index) {
    selectedTipIndex.value = index;
  }

  void setCustomTip(double amount) {
    customTip.value = amount;
  }

  Stream<double> get tip {
    return subtotal.asyncMap((subtotalValue) async {
      if (selectedTipIndex.value == 4) {
        return customTip.value;
      }

      return subtotalValue *
          tipPercentages[selectedTipIndex.value];
    });
  }

  Stream<double> get total {
    return subtotal.asyncMap((subtotalValue) async {
      double tipAmount;

      if (selectedTipIndex.value == 4) {
        tipAmount = customTip.value;
      } else {
        tipAmount =
            subtotalValue * tipPercentages[selectedTipIndex.value];
      }

      return subtotalValue -
          discount.value +
          serviceCharge.value +
          tipAmount;
    });
  }
}