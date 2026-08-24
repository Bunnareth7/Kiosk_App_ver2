import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class OrderDetailHeader extends StatelessWidget {
  const OrderDetailHeader({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background container
        Container(
          width: 375.w,
          height: 170.h,
          color: AppColor.neutral100,
        ),

        Positioned(
          top: 36.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 122.4.w,
              height: 122.4.w,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),

        // Back Button
        Positioned(
          top: 12.h,
          left: 12.w,
          child: AnimInkWell(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(6.w),

              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16.w,
                color: AppColor.mainprimarykoi,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
