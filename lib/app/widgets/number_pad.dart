import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({
    super.key,
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
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 6.h),
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
            4.verticalSpace,
            _keyRow(['4', '5', '6']),
            4.verticalSpace,
            _keyRow(['7', '8', '9']),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: KeypadButton(
                    onTap: onBackspace,
                    child: Icon(
                      Icons.backspace_outlined,
                      size: 14.w,
                      color: AppColor.neutral400,
                    ),
                  ),
                ),
                8.horizontalSpace,
                Expanded(child: _keyButton('0')),
                8.horizontalSpace,
                Expanded(
                  child: KeypadButton(
                    onTap: onConfirm,
                    backgroundColor: AppColor.neutral100,
                    child: Icon(Icons.check, size: 16.w, color: Colors.green),
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
    return KeypadButton(
      onTap: () => onDigit(digit),
      child: Text(
        digit,
        style: AppTextStyle.body2_500.copyWith(color: AppColor.neutral700),
      ),
    );
  }
}

class KeypadButton extends StatelessWidget {
  const KeypadButton({
    super.key,
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
        height: 26.h,
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
