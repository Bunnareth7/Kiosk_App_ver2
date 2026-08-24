import 'package:get/get.dart';

import '../controllers/select_terminal_controller.dart';

class SelectTerminalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectTerminalController>(
      () => SelectTerminalController(),
    );
  }
}
