import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/home/widgets/home_header.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_category.dart';
import '../widgets/home_product_grid.dart';
import '../widgets/home_sidebar.dart';
import '../widgets/view_cart_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static void open() => Get.toNamed(Routes.HOME);

  static const List<HomeCategory> _categories = [
    HomeCategory('Best Sellers', AppPath.iconKio6),
    HomeCategory('Promotion', AppPath.iconKio5),
    HomeCategory('Member Benefits', AppPath.iconKio5),
    HomeCategory('Tea Set', AppPath.iconKio5),
    HomeCategory('Chewy Tea', AppPath.iconKio5),
    HomeCategory('Milk Tea', AppPath.iconKio5),
    HomeCategory('Signature Tea & Juice', AppPath.iconKio5),
    HomeCategory('Flavored Tea & Juice', AppPath.iconKio5),
    HomeCategory('Merchandise', AppPath.iconKio5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: Column(
        children: [
          const CostumHomeAppbar(),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 80.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeSidebar(
                        controller: controller,
                        categories: _categories,
                      ),
                      const Expanded(child: HomeProductGrid()),
                    ],
                  ),
                ),
                Obx(() {
                  if (controller.cartItemCount.value == 0) {
                    return const SizedBox.shrink();
                  }
                  return Positioned(
                    left: 0,
                    right: 0,
                    bottom: 15.h,
                    child: ViewCartButton(
                      quantity: controller.cartItemCount.value,
                      totalPrice: controller.cartTotalPrice.value,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
