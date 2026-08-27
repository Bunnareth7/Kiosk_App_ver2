import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutPriceSummary extends StatelessWidget {
  const CheckoutPriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.neutral100,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          _PriceRow(
            title: 'Subtotal (VAT incl.)',
            value: '\$7.20',
          ),

          8.verticalSpace,

          _PriceRow(
            title: 'Total Discount',
            value: '-\$2.40',
            valueColor: AppColor.error500,
          ),

          8.verticalSpace,

          _PriceRow(
            title: 'Service Charge',
            value: '\$1.00',
          ),

          8.verticalSpace,

          _PriceRow(
            title: 'VAT',
            value: '10%',
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.title,
    required this.value,
    this.valueColor,
  });

  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.body2_500.copyWith(
            color: AppColor.neutral800,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.body3_500.copyWith(
            color: valueColor ?? AppColor.neutral800,
          ),
        ),
      ],
    );
  }
}