import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/add_coupon_button.dart';

import '../controllers/apply_coupon_controller.dart';
import '../widgets/coupon_card.dart';

class ApplyCouponView extends GetView<ApplyCouponController> {
  const ApplyCouponView({super.key});
  static void open() => Get.toNamed(Routes.APPLY_COUPON);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
        ),
        title: Text('Apply Coupon', style: AppTextStyle.body1_600),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddCouponButton(onTap: controller.onAddCouponTap),
            20.verticalSpace,
            Text(
              'Available Coupon',
              style: AppTextStyle.body2_600.copyWith(
                color: AppColor.neutral800,
              ),
            ),
            6.verticalSpace,
            Text(
              'Enjoy a variety of exclusive coupons and discounts. '
              'Check back regularly for new deals and save more on your '
              'favorite purchases!',
              style: AppTextStyle.body4_400.copyWith(
                color: AppColor.neutral500,
              ),
            ),
            16.verticalSpace,

            Obx(
              () => Column(
                children: controller.coupons
                    .map(
                      (coupon) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CouponCard(coupon: coupon),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}