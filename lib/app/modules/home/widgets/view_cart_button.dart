import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/checkout/views/checkout_view.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class ViewCartButton extends StatelessWidget {
  const ViewCartButton({
    super.key,
    required this.quantity,
    required this.totalPrice,
  });

  final int quantity;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: () {
        CheckoutView.open();
      },
      child: Container(
        height: 50.h,
        width: 343.w,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColor.neutral100,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.r,
              offset: Offset(0, 3.h),
              color: Colors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppPath.shoppingCart, width: 20.w, height: 20.w),

            10.horizontalSpace,
            Text('View Cart x$quantity', style: AppTextStyle.body2_500),

            const Spacer(),
            Text(
              '\$${totalPrice.toStringAsFixed(2)}',
              style: AppTextStyle.body2_500.copyWith(
                color: AppColor.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
