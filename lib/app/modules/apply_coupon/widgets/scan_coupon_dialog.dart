import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class ScanCouponDialog extends StatelessWidget {
  const ScanCouponDialog({super.key});

  static void show() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: const ScanCouponDialog(),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.neutral100,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        width: 235.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Scan Coupon', style: AppTextStyle.body2_700),

              20.verticalSpace,

              SizedBox(
                width: 125.w,
                height: 125.w,
                child: SvgPicture.asset(AppPath.koiWalletqr),
              ),

              20.verticalSpace,

              Text(
                'Scan QR code to log in and access \n coupon rewards!',
                textAlign: TextAlign.center,
                style: AppTextStyle.body3_400,
              ),

              20.verticalSpace,

              SizedBox(
                width: 203.w,
                height: 32.h,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.mainprimarykoi),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'CANCEL',
                      style: AppTextStyle.body3_600.copyWith(
                        color: AppColor.mainprimarykoi,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
