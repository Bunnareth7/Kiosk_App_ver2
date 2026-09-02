import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class ScanCouponDialog extends StatefulWidget {
  const ScanCouponDialog({super.key});

  static void show() {
    Get.dialog(
      ScanCouponDialog(),
      barrierDismissible: false,
      barrierColor: Colors.black54,
    );
  }

  @override
  State<ScanCouponDialog> createState() => _ScanCouponDialogState();
}

class _ScanCouponDialogState extends State<ScanCouponDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.neutral100,
      insetPadding: EdgeInsets.symmetric(horizontal: 68.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        width: 270.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Scan Coupon', style: AppTextStyle.body2_700),

              18.verticalSpace,

              SizedBox(
                width: 130.w,
                height: 130.w,
                child: SvgPicture.asset(AppPath.koiWalletqr),
              ),

              14.verticalSpace,

              Text(
                'Scan QR code to log in and access \n coupon rewards!',
                textAlign: TextAlign.center,
                style: AppTextStyle.body3_400,
              ),

              14.verticalSpace,

              SizedBox(
                width: double.infinity,
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
