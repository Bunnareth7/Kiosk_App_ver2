import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.neutral100,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: AppTextStyle.body2_600.copyWith(color: AppColor.neutral800),
          ),

          12.verticalSpace,

          Row(
            children: [
              const Expanded(
                child: _PaymentMethod(
                  iconPath: AppPath.koi,
                  title: 'KOI Wallet',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  iconPath: AppPath.khqrIcon,
                  title: 'KHQR',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  iconPath: AppPath.creditCard,
                  title: 'Credit Card',
                ),
              ),
            ],
          ),

          8.verticalSpace,

          Row(
            children: [
              const Expanded(
                child: _PaymentMethod(iconPath: AppPath.cash, title: 'Cash'),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  iconPath: AppPath.alipay,
                  title: 'AliPay',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  iconPath: AppPath.wepay,
                  title: 'WeChat Pay',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod({required this.iconPath, required this.title});

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 108.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColor.neutral200,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.neutral200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath.endsWith('.svg'))
            SvgPicture.asset(iconPath, height: 22.sp, width: 22.sp)
          else
            Image.asset(
              iconPath,
              height: 22.sp,
              width: 22.sp,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error_outline,
                  size: 22.sp,
                  color: AppColor.neutral500,
                );
              },
            ),
          5.horizontalSpace,
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body4_500.copyWith(
                color: AppColor.neutral500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
