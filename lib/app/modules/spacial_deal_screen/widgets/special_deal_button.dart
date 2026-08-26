import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/modules/home/views/home_view.dart';

import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class SpecialDealButton extends StatelessWidget {
  const SpecialDealButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 32.h,
      child: InkWell(
        onTap: () {
          HomeView.open();
        },
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.neutral50,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              'NOT TODAY',
              style: AppTextStyle.body3_600.copyWith(
                color: AppColor.neutral400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}