import 'dart:async';

import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/cart_summary.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxInt selectedCategory = 0.obs;

  final RxInt cartItemCount = 0.obs;
  final RxDouble cartTotalPrice = 0.0.obs;

  late final CartDao cartDao;

  StreamSubscription<CartSummary>? _cartSubscription;

  @override
  void onInit() {
    super.onInit();

    final database = Get.find<AppDatabase>();
    cartDao = CartDao(database);

    _cartSubscription = cartDao.watchCartSummary().listen((summary) {
      cartItemCount.value = summary.quantity;
      cartTotalPrice.value = summary.totalPrice;
    });
  }

  @override
  void onClose() {
    _cartSubscription?.cancel();
    super.onClose();
  }
}