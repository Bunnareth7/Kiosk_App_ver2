import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class OrderOptionSectionHeader extends StatelessWidget {
  const OrderOptionSectionHeader({
    super.key,
    required this.title,
    this.requiredCount,
  });

  final String title;
  final int? requiredCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.body3_600),
        if (requiredCount != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColor.mainprimarykoi.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '$requiredCount Required',
              style: AppTextStyle.body4_400.copyWith(
                color: AppColor.mainprimarykoi,
              ),
            ),
          ),
      ],
    );
  }
}
