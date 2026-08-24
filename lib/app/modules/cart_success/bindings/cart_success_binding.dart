import 'package:get/get.dart';

import '../controllers/cart_success_controller.dart';

class CartSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartSuccessController>(
      () => CartSuccessController(),
    );
  }
}
