import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutRemark extends StatelessWidget {
  const CheckoutRemark({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        color: AppColor.neutral100,
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Remark',
                style: AppTextStyle.body3_600.copyWith(
                  color: AppColor.neutral800,
                ),
              ),
            ),

            Text(
              'Add Remark',
              style: AppTextStyle.body3_500.copyWith(
                color: AppColor.neutral400,
              ),
            ),

            Icon(
              Icons.chevron_right,
              size: 18.sp,
              color: AppColor.neutral400,
            ),
          ],
        ),
      ),
    );
  }
}