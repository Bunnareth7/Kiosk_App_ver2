import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class CostumHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CostumHomeAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.neutral100,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDecoration.paddingM12),
        child: Row(
          children: [
            AnimInkWell(onTap: () { 
              navigator?.pop();
             },
            child: SvgPicture.asset(AppPath.backbutton, width: 20.w, height: 20.w)),

            const Spacer(),

            SvgPicture.asset(AppPath.profileIcon, width: 18.w, height: 18.w),
            6.horizontalSpace,
            Text('Member', style: AppTextStyle.body3_500),
            20.horizontalSpace,
            SvgPicture.asset(AppPath.actionIcon, width: 18.w, height: 18.w),
            6.horizontalSpace,
            Text('Coupon', style: AppTextStyle.body3_500),
          ],
        ),
      ),
    );
  }
}
