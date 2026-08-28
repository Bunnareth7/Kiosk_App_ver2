import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.neutral100,
      padding: EdgeInsets.only(
        right: 16.w,
        top :10.h,
        left: 16.w,
        
      ),
      child: Column(
        children: [
          Text(
            'CHECKOUT',
            style: AppTextStyle.body2_600.copyWith(
              color: AppColor.neutral800,
            ),
          ),
          2.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text(
                'DINE IN',
                style: AppTextStyle.body3_500.copyWith(
                  color: AppColor.neutral500,
                ),
              ),
              4.horizontalSpace,
              Icon(Icons.arrow_drop_down, size: 16.sp, color: AppColor.neutral500),
            ],
          ),

          12.verticalSpace,

          _ProgressSteps(),
        ],
      ),
    );
  }
}

class _ProgressSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Stack(
        children: [
          // Background line
          Positioned(
            top: 1.h,
            left: 30.w,
            right: 30.w,
            child: Container(
              height:3.h,
              color: AppColor.neutral200,
            ),
          ),

          // Orange progress line
          Positioned(
            top: 1.h,
            left: 20.w,
            width: 135.w,
            child: Container(
              height: 3.h,
              color: AppColor.mainprimarykoi,
            ),
          ),

          // Step labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _step('MENU', isActive: true),
              _step('CART', isActive: true),
              _step('CHECKOUT', isActive: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _step(String title ,{bool isActive = false} ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7.w,
          height: 7.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
           color: isActive ? AppColor.mainprimarykoi : AppColor.neutral200,
          ),
        ),
        5.verticalSpace,
        Text(
          title,
          style: AppTextStyle.body3_500.copyWith(
            color: AppColor.neutral800,
          ),
        ),
      ],
    );
  }
}