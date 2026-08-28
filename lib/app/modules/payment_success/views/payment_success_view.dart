import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

import '../controllers/payment_success_controller.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  const PaymentSuccessView({super.key});

  static void open({required double total}) {
    Get.toNamed('/payment-success', arguments: {'total': total});
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map?;
    final total = (arguments?['total'] ?? 0.0).toDouble();

    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success GIF
            SizedBox(
              width: 150.w,
              height: 150.w,
              child: Image.asset(
                AppPath.checkGif,
                width: 150.w,
                height: 150.w,
                fit: BoxFit.contain,
              ),
            ),

            20.verticalSpace,

            // Payment Successful
            Text(
              'Payment Successful',
              style: AppTextStyle.body2_700.copyWith(
                color: AppColor.neutral800,
              ),
            ),

            4.verticalSpace,

            // Subtitle
            Text(
              'Enjoy your drink',
              style: AppTextStyle.body4_400.copyWith(
                color: AppColor.neutral500,
              ),
            ),

            12.verticalSpace,
            // Total
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: AppTextStyle.body3_600.copyWith(
                color: AppColor.neutral800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
