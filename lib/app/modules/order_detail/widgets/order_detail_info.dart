import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

/// Product name + description text.
class OrderProductInfo extends StatelessWidget {
  const OrderProductInfo({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.body2_700
        ),
        4.verticalSpace,
        
        Text(
          'Rich black tea meets creamy fresh milk for the perfect balance. '
          'Our Classic Milk Tea offers a smooth, comforting taste you\'ll love.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.body4_400.copyWith(color: AppColor.neutral500),
        ),
      ],
    );
  }
}