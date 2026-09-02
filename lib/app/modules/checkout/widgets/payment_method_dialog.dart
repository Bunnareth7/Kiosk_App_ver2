import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class PaymentInformationDialog extends StatelessWidget {
  const PaymentInformationDialog({super.key});

  static void show() {
    Get.dialog(
      const PaymentInformationDialog(),
      barrierDismissible: false,
      barrierColor: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.neutral100,
      insetPadding: EdgeInsets.symmetric(horizontal: 68.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SizedBox(
        width: 235.w,
        
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Information',
                style: AppTextStyle.body3_700,
              ),
              20.verticalSpace,
              Text(
                'Oops! This feature is coming soon.\n'
                'Please try another method. \n Thanks!',
                textAlign: TextAlign.center,
                style: AppTextStyle.body3_400,
              ),
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 36.h,
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