import 'dart:async';

import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/database/daos/cart_dao.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';

class PaymentSuccessController extends GetxController {
  Timer? _returnHomeTimer;

  @override
  void onReady() {
    super.onReady();

    _returnHomeTimer = Timer(const Duration(seconds: 2), () async {
      final cartDao = CartDao(Get.find<AppDatabase>());
      await cartDao.clearCart();

      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {
    _returnHomeTimer?.cancel();
    super.onClose();
  }
}
