import 'dart:async';
import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/spacial_deal_screen/views/spacial_deal_screen_view.dart';

class CartSuccessController extends GetxController {
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    _timer = Timer(const Duration(seconds: 2), () {
      if (Get.currentRoute == '/cart-success') {
        SpacialDealScreenView.open();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}