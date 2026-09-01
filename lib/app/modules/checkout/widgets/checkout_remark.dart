import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class CheckoutRemark extends StatelessWidget {
  const CheckoutRemark({super.key, required this.onTap, required this.remark});

  final VoidCallback onTap;
  final String remark;

  @override
  Widget build(BuildContext context) {
    final hasRemark = remark.isNotEmpty;

    return AnimInkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
              hasRemark ? remark : 'Add Remark',
              style: AppTextStyle.body3_500.copyWith(
                color: hasRemark ? AppColor.neutral800 : AppColor.neutral400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Icon(Icons.chevron_right, size: 18.sp, color: AppColor.neutral400),
          ],
        ),
      ),
    );
  }
}
