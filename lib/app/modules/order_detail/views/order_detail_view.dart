import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_button_bar.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_detail_header.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_detail_info.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

import '../controllers/order_detail_controller.dart';
import '../widgets/cup_size_section.dart';
import '../widgets/ice_level_section.dart';
import '../widgets/sugar_level_section.dart';
import '../widgets/topping_section.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({super.key});
  static void open(dynamic product) =>
      Get.toNamed(Routes.ORDER_DETAIL, arguments: product);

  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetailHeader(imagePath: product.imagePath),
                    Padding(
                      padding: EdgeInsets.all(AppDecoration.paddingL16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderProductInfo(name: product.name),
                          12.verticalSpace,
                          Obx(
                            () => CupSizeSection(
                              basePrice: product.price,
                              selectedIndex:
                                  controller.selectedCupSizeIndex.value,
                              extraPrices:
                                  OrderDetailController.cupSizeExtraPrices,
                              onSelect: controller.selectCupSize,
                            ),
                          ),
                          12.verticalSpace,
                          Obx(
                            () => SugarLevelSection(
                              selectedIndex:
                                  controller.selectedSugarIndex.value,
                              onSelect: controller.selectSugar,
                            ),
                          ),
                          12.verticalSpace,
                          Obx(
                            () => IceLevelSection(
                              selectedIndex: controller.selectedIceIndex.value,
                              onSelect: controller.selectIce,
                            ),
                          ),
                          12.verticalSpace,
                          Obx(
                            () => ToppingSection(
                              selectedIndexes:
                                  controller.selectedToppingIndexes.value,
                              onToggle: controller.toggleTopping,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => OrderBottomBar(
                subtotal: controller.subtotal,
                quantity: controller.quantity.value,
                onIncrement: controller.incrementQuantity,
                onDecrement: controller.decrementQuantity,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
