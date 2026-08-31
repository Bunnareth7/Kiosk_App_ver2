import 'package:get/get.dart';

import '../controllers/apply_coupon_controller.dart';

class ApplyCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplyCouponController>(
      () => ApplyCouponController(),
    );
  }
}
