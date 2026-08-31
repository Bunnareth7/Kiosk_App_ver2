import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/dash_border.dart';


class AddCouponButton extends StatelessWidget {
  const AddCouponButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: DashedRectBorder(
        color: AppColor.mainprimarykoi,
        borderRadius: 12.r,
        child: Container(
          width: double.infinity,
          height: 42.h,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.confirmation_number_outlined,
                size: 18.sp,
                color: AppColor.mainprimarykoi,
              ),
              6.horizontalSpace,
              Text(
                'Add Coupon',
                style: AppTextStyle.body3_600.copyWith(
                  color: AppColor.mainprimarykoi,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}