import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class SpecialDealProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const SpecialDealProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 26.h,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: AppTextStyle.body5_500.copyWith(fontSize: 10.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Text(
          price,
          textAlign: TextAlign.center,
          style: AppTextStyle.body5_500.copyWith(
            color: AppColor.error500,
            fontSize: 10.sp,
          ),
          
        ),
      ],
    );
  }
}
