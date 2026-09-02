import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CustomTipDialog extends StatefulWidget {
  const CustomTipDialog({super.key});

  static Future<double?> show() {
    Get.focusScope?.unfocus();
    return Get.dialog<double>(
      const _CustomTipDialogWrapper(),
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.25),
    );
  }

  @override
  State<CustomTipDialog> createState() => _CustomTipDialogState();
}
class _CustomTipDialogWrapper extends StatelessWidget {
  const _CustomTipDialogWrapper();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: const SizedBox.expand(),
          ),
        ),
        const CustomTipDialog(),
      ],
    );
  }
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
    return Stack(
      children: [
        Center(child: _buildDialogCard()),
        Align(
          alignment: Alignment.bottomCenter,
          child: _NumberPad(
            onDigit: _onDigitTap,
            onBackspace: _onBackspace,
            onConfirm: _apply,
          ),
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

class _NumberPad extends StatelessWidget {
  const _NumberPad({
    required this.onDigit,
    required this.onBackspace,
    required this.onConfirm,
  });

  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 190.h,
        width: 375.w,
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
        decoration: BoxDecoration(
          color: AppColor.neutral100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _keyRow(['1', '2', '3']),
            6.verticalSpace,
            _keyRow(['4', '5', '6']),
            6.verticalSpace,
            _keyRow(['7', '8', '9']),
            6.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: _KeypadButton(
                    onTap: onBackspace,
                    child: Icon(
                      Icons.backspace_outlined,
                      size: 16.sp,
                      color: AppColor.neutral400,
                    ),
                  ),
                ),
                8.horizontalSpace,
                Expanded(child: _keyButton('0')),
                8.horizontalSpace,
                Expanded(
                  child: _KeypadButton(
                    onTap: onConfirm,
                    backgroundColor: AppColor.neutral100,
                    child: Icon(Icons.check, size: 18.sp, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _keyRow(List<String> keys) {
    return Row(
      children: [
        for (int i = 0; i < keys.length; i++) ...[
          if (i != 0) 8.horizontalSpace,
          Expanded(child: _keyButton(keys[i])),
        ],
      ],
    );
  }

  Widget _keyButton(String digit) {
    return _KeypadButton(
      onTap: () => onDigit(digit),
      child: Text(
        digit,
        style: AppTextStyle.body2_600.copyWith(color: AppColor.neutral700),
      ),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  const _KeypadButton({
    required this.onTap,
    required this.child,
    this.backgroundColor,
  });

  final VoidCallback onTap;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.neutral200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: child,
      ),
    );
  }
}
