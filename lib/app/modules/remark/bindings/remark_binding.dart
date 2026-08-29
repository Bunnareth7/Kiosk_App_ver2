import 'package:get/get.dart';

import '../controllers/remark_controller.dart';

class RemarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemarkController>(
      () => RemarkController(),
    );
  }
}
