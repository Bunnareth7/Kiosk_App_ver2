import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_path.dart';

import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class SpecialDealHeader extends StatelessWidget {
  const SpecialDealHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.neutral200),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppPath.spacialDeal, width: 20.w, height: 20.w),
          8.horizontalSpace,
          Text('Special Deal for You', style: AppTextStyle.body2_700),
        ],
      ),
    );
  }
}
