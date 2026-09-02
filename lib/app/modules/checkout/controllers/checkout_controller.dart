import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';
import 'package:kiosk_app/app/modules/checkout/widgets/tip_dialog.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';

class CheckoutController extends GetxController {
  late final CartDao cartDao;

  final RxInt selectedTipIndex = 0.obs;

  static const List<double> tipPercentages = [0.0, 0.10, 0.15, 0.20, 0.0];

  final RxDouble customTip = 0.0.obs;

  final RxInt selectedPaymentIndex = 0.obs;

  final RxDouble discount = 0.0.obs;
  final RxDouble serviceCharge = 1.00.obs;
  final RxDouble vat = 10.0.obs;

  final RxDouble total = 0.0.obs;

  double currentSubtotal = 0.0;

  @override
  void onInit() {
    super.onInit();

    final database = Get.find<AppDatabase>();
    cartDao = CartDao(database);

    subtotal.listen((value) {
      currentSubtotal = value;
      calculateTotal();
    });
  }

  Stream<List<CartItem>> get cartItems => cartDao.watchCartItems();

  Stream<double> get subtotal =>
      cartDao.watchCartSummary().map((summary) => summary.totalPrice);

  Stream<int> get totalQuantity =>
      cartDao.watchCartSummary().map((summary) => summary.quantity);

  Future<void> deleteCartItem(int id) async {
    await cartDao.deleteCartItem(id);
  }

  Future<void> selectTip(int index) async {
    selectedTipIndex.value = index;

    if (index == 4) {
      final value = await CustomTipDialog.show();

      if (value != null) {
        setCustomTip(value);
      }
    } else {
      customTip.value = 0.0;
      calculateTotal();
    }
  }

  void setCustomTip(double amount) {
    customTip.value = amount;
    calculateTotal();
  }

  double calculateTip() {
    if (selectedTipIndex.value == 4) {
      return customTip.value;
    }

    return currentSubtotal * tipPercentages[selectedTipIndex.value];
  }

  void calculateTotal() {
    final tipValue = calculateTip();

    total.value =
        currentSubtotal - discount.value + serviceCharge.value + tipValue;
  }

  Stream<double> get tip {
    return subtotal.map((subtotalValue) {
      if (selectedTipIndex.value == 4) {
        return customTip.value;
      }

      return subtotalValue * tipPercentages[selectedTipIndex.value];
    });
  }

  void selectPayment(int index) {
    selectedPaymentIndex.value = index;
  }

  final remark = ''.obs;

  Future<void> openRemark() async {
    final result = await Get.toNamed(Routes.REMARK);

    if (result != null) {
      remark.value = result;
    }
  }

  Future<void> updateQuantity(int id, int quantity) async {
    if (quantity <= 0) return;

    await cartDao.updateQuantity(id, quantity);
  }
}
