import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/cart_success/controllers/cart_success_controller.dart';
import 'package:kiosk_app/app/modules/spacial_deal_screen/views/spacial_deal_screen_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CartSuccessView extends GetView<CartSuccessController> {
  const CartSuccessView({super.key});

  static void open({required double subtotal, required int quantity}) {
    Get.toNamed(
      Routes.CART_SUCCESS,
      arguments: {'subtotal': subtotal, 'quantity': quantity},
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map?;
    final subtotal = arguments?['subtotal'] ?? 0.0;

    // Auto-navigate back after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
     SpacialDealScreenView.open();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60.w,
              height: 60.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      AppPath.shoppingCart,
                      width: 60.w,
                      height: 60.w,
                    ),
                  ),

                  Positioned(
                    right: -19,
                    top: -19,
                    child: Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: ClipOval(
                        child: Image.asset(AppPath.checkGif, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Text('Item added to Cart!', style: AppTextStyle.body2_700),
            4.verticalSpace,
            Text(
              'Added successfully',
              style: AppTextStyle.body4_400.copyWith(
                color: AppColor.neutral500,
              ),
            ),
            12.verticalSpace,
            Text(
              '\$${subtotal.toStringAsFixed(2)}',
              style: AppTextStyle.body3_600,
            ),
          ],
        ),
      ),
    );
  }
}
