import 'package:get/get.dart';

import '../controllers/spacial_deal_screen_controller.dart';

class SpacialDealScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpacialDealScreenController>(
      () => SpacialDealScreenController(),
    );
  }
}
