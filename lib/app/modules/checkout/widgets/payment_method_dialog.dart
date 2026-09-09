import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class PaymentInformationDialog extends StatelessWidget {
  const PaymentInformationDialog({super.key});

  static void show() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: const PaymentInformationDialog(),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black54,
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Information', style: AppTextStyle.body3_700),
              16.verticalSpace,
              Text(
                'Oops! This feature is coming soon.\n'
                'Please try another method. \n Thanks!',
                textAlign: TextAlign.center,
                style: AppTextStyle.body3_400
              ),
              16.verticalSpace,
              SizedBox(
                height: 32.h,
                width: 203.w,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.mainprimarykoi,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'OKAY',
                      style: AppTextStyle.body3_600.copyWith(
                        color: AppColor.neutral100,
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
