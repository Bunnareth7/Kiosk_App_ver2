import 'package:get/get.dart';

import '../controllers/defualt_lang_setting_controller.dart';

class DefualtLangSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DefualtLangSettingController>(
      () => DefualtLangSettingController(),
    );
  }
}
