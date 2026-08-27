import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key,
    required this.total,
    required this.onCheckout,
  });

  final double total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        10.h,
        16.w,
        12.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.neutral100,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total (VAT incl.)',
                  style: AppTextStyle.body2_600.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),

                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: AppTextStyle.body2_600.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),
              ],
            ),

            10.verticalSpace,

            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: ElevatedButton(
                onPressed: onCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainprimarykoi,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'CHECK OUT',
                  style: AppTextStyle.body2_600.copyWith(
                    color: AppColor.neutral100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}