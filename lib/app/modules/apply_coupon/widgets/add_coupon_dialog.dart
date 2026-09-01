import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class AddCouponDialog extends StatelessWidget {
  AddCouponDialog({super.key});

  final TextEditingController _codeController = TextEditingController();

  static Future<String?> show() {
    return Get.dialog<String>(AddCouponDialog(), barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.neutral100,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SizedBox(
        width: 235.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Coupon', style: AppTextStyle.body1_700),
              20.verticalSpace,

              // Code input field
              SizedBox(
                height: 42.h,
                width: 220.w,
                child: TextField(
                  controller: _codeController,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  style: AppTextStyle.body3_500,
                  decoration: InputDecoration(
                    hintText: 'Enter Code',
                    hintStyle: AppTextStyle.body3_500.copyWith(
                      color: AppColor.neutral400,
                    ),
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(
                        AppPath.qrCode,
                        width: 18.w,
                        height: 18.w,
                        
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColor.neutral400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColor.mainprimarykoi,
                      ),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              // Cancel / Apply buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 32.h,
                      child: AnimInkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.mainprimarykoi,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
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
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 32.h,
                      child: AnimInkWell(
                        onTap: () {
                          final code = _codeController.text.trim();
                          if (code.isEmpty) return;

                          Get.back(result: code);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.mainprimarykoi,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            'APPLY',
                            style: AppTextStyle.body3_600.copyWith(
                              color: AppColor.neutral100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
