import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';

class CheckoutController extends GetxController {
  late final CartDao cartDao;

  @override
  void onInit() {
    super.onInit();

    final database = Get.find<AppDatabase>();
    cartDao = CartDao(database);
  }

  Stream<List<CartItem>> get cartItems => cartDao.watchCartItems();

  Stream<double> get subtotal => cartDao
      .watchCartSummary()
      .map((summary) => summary.totalPrice);

  Stream<int> get totalQuantity => cartDao
      .watchCartSummary()
      .map((summary) => summary.quantity);
}