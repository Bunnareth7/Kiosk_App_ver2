import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/number_pad.dart';

class CustomTipDialog extends StatefulWidget {
  const CustomTipDialog({super.key});

  static Future<double?> show() {
    Get.focusScope?.unfocus();

    return Get.dialog<double>(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: const CustomTipDialog(),
      ),
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.10),
    );
  }

  @override
  State<CustomTipDialog> createState() => _CustomTipDialogState();
}

class _CustomTipDialogState extends State<CustomTipDialog> {
  String _digits = '0';

  void _onDigitTap(String digit) {
    setState(() {
      if (_digits == '0') {
        _digits = digit;
      } else if (_digits.length < 6) {
        _digits += digit;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_digits.length <= 1) {
        _digits = '0';
      } else {
        _digits = _digits.substring(0, _digits.length - 1);
      }
    });
  }

  void _apply() {
    final value = double.tryParse(_digits);

    if (value == null || value < 0) return;

    Get.back(result: value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: _buildDialogCard())),
        NumberPad(
          onDigit: _onDigitTap,
          onBackspace: _onBackspace,
          onConfirm: _apply,
        ),
      ],
    );
  }

  Widget _buildDialogCard() {
    return Dialog(
      backgroundColor: AppColor.neutral100,
      insetPadding: EdgeInsets.symmetric(horizontal: 84.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SizedBox(
        width: 235.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Custom Tip', style: AppTextStyle.body2_700),

              10.verticalSpace,

              Text(
                '\$$_digits',
                textAlign: TextAlign.center,
                style: AppTextStyle.headline3_500.copyWith(
                  color: AppColor.neutral400,
                ),
              ),

              10.verticalSpace,

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 32.h,
                      width: 96.5.w,
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
                  ),

                  10.horizontalSpace,

                  Expanded(
                    child: SizedBox(
                      height: 32.h,
                      width: 96.5.w,
                      child: GestureDetector(
                        onTap: _apply,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.mainprimarykoi,
                            borderRadius: BorderRadius.circular(8.r),
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