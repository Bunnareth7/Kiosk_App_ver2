import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/data/Model/entity/coupon_entity.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/dash_vertical.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/modules/apply_coupon/widgets/ticket_clipper.dart';


class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.coupon});

  final CouponEntity coupon;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const TicketClipper(notchRadius: 8),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColor.primarykoi100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image placeholder
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: AppColor.mainprimarykoi.withOpacity(0.7),
                
              ),
              child: coupon.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(coupon.imagePath!, fit: BoxFit.contain),
                    )
                  : null,
            ),
            12.horizontalSpace,

            // Info block
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coupon.title,
                    style: AppTextStyle.body3_600.copyWith(
                      color: AppColor.neutral800,
                    ),
                  ),
                  6.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 12.sp,
                        color: AppColor.neutral500,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Min. purchase \$${coupon.minPurchase.toStringAsFixed(0)}',
                        style: AppTextStyle.body4_400.copyWith(
                          color: AppColor.neutral500,
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12.sp,
                        color: AppColor.neutral500,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Expired at ${coupon.expiredDate}',
                        style: AppTextStyle.body4_400.copyWith(
                          color: AppColor.neutral500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            12.horizontalSpace,
            DashedVerticalLine(
              height: 56.h,
              color: AppColor.mainprimarykoi.withOpacity(0.4),
            ),
            12.horizontalSpace,

            // Reward label
            SizedBox(
              width: 70.w,
              child: Text(
                coupon.rewardLabel,
                textAlign: TextAlign.center,
                style: AppTextStyle.body3_600.copyWith(
                  color: AppColor.primarykoi400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}