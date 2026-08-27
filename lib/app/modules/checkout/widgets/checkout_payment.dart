import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  // TODO: swap for your KOI Wallet image asset
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'KOI Wallet',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  // TODO: swap for your KHQR image asset
                  icon: Icons.qr_code_2,
                  title: 'KHQR',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  // TODO: swap for your Credit Card image asset
                  icon: Icons.credit_card_outlined,
                  title: 'Credit Card',
                ),
              ),
            ],
          ),

          8.verticalSpace,

          Row(
            children: [
              const Expanded(
                child: _PaymentMethod(
                  // TODO: swap for your Cash image asset
                  icon: Icons.money_outlined,
                  title: 'Cash',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  // TODO: swap for your AliPay image asset
                  icon: Icons.payment,
                  title: 'AliPay',
                ),
              ),
              8.horizontalSpace,
              const Expanded(
                child: _PaymentMethod(
                  // TODO: swap for your WeChat Pay image asset
                  icon: Icons.chat_bubble_outline,
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
  const _PaymentMethod({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 108.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColor.neutral50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.neutral200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 17.sp, color: AppColor.neutral500),
          5.horizontalSpace,
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body3_400.copyWith(
                color: AppColor.neutral500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
