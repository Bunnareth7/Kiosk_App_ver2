import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutPriceSummary extends StatelessWidget {
  const CheckoutPriceSummary({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.serviceCharge,
    required this.vat,
  });

  final double subtotal;
  final double discount;
  final double serviceCharge;
  final double vat;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.neutral100,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          _PriceRow(
            title: 'Subtotal (VAT incl.)',
            value: '\$${subtotal.toStringAsFixed(2)}',
            titleStyle: AppTextStyle.body2_500,
            valueStyle: AppTextStyle.body3_500,
          ),

          8.verticalSpace,
          _PriceRow(
            title: 'Total Discount',
            value: '-\$${discount.toStringAsFixed(2)}',
            titleStyle: AppTextStyle.body2_400,
            valueStyle: AppTextStyle.body2_400,
            valueColor: AppColor.error500,
          ),

          8.verticalSpace,

          _PriceRow(
            title: 'Service Charge',
            value: '\$${serviceCharge.toStringAsFixed(2)}',
            titleStyle: AppTextStyle.body2_400,
            valueStyle: AppTextStyle.body2_400,
          ),

          8.verticalSpace,

          _PriceRow(
            title: 'VAT',
            value: '${vat.toStringAsFixed(0)}%',
            titleStyle: AppTextStyle.body2_400,
            valueStyle: AppTextStyle.body2_400,
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
    required this.titleStyle,
    required this.valueStyle,
    this.valueColor,
  });

  final String title;
  final String value;
  final TextStyle titleStyle;
  final TextStyle valueStyle;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle.copyWith(color: AppColor.neutral800)),
        Text(
          value,
          style: valueStyle.copyWith(color: valueColor ?? AppColor.neutral800),
        ),
      ],
    );
  }
}
