import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/add_coupon_dialog.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class CostumHomeAppbar extends StatelessWidget {
  const CostumHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: AppColor.neutral100,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child: Row(
          children: [
            AnimInkWell(
              onTap: () {
                navigator?.pop();
              },
              child: SvgPicture.asset(
                AppPath.backbutton,
                width: 20.w,
                height: 20.w,
              ),
            ),

            const Spacer(),

            AnimInkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppPath.profileIcon,
                    width: 18.w,
                    height: 18.w,
                  ),
                  6.horizontalSpace,
                  Text('Member', style: AppTextStyle.body3_500),
                ],
              ),
            ),

            20.horizontalSpace,

            AnimInkWell(
              onTap: AddCouponDialog.show,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppPath.actionIcon,
                    width: 18.w,
                    height: 18.w,
                  ),
                  6.horizontalSpace,
                  Text('Coupon', style: AppTextStyle.body3_500),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
