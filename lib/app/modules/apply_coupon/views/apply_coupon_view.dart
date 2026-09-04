import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/add_coupon_dialog.dart';
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
      backgroundColor: AppColor.neutral100,
      body: Column(
        children: [
          _ApplyCouponHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddCouponButton(
                    onTap: () async {
                      final code = await AddCouponDialog.show();
                      if (code != null) {}
                    },
                  ),

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
          ),
        ],
      ),
    );
  }
}

class _ApplyCouponHeader extends StatelessWidget {
  const _ApplyCouponHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.neutral100,
      padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
      child: SizedBox(
        height: 36.h,
        child: Row(
          children: [
            GestureDetector(
              onTap: Get.back,
              child: SvgPicture.asset(
                AppPath.backbutton,
                width: 18.w,
                height: 18.w,
              ),
            ),

            Expanded(
              child: Center(
                child: Text(
                  'Apply Coupon',
                  style: AppTextStyle.body3_600.copyWith(
                    color: AppColor.neutral800,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),

            SizedBox(width: 18.w),
          ],
        ),
      ),
    );
  }
}
