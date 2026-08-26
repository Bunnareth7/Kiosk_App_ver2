import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

import 'special_deal_product_item.dart';

class SpecialDealGrid extends StatelessWidget {
  const SpecialDealGrid({super.key});

  static const List<Map<String, String>> products = [
    {'name': 'KOI CHIPS', 'price': '+\$0.70 Only', 'image': AppPath.koichip},
    {
      'name': 'Jumbo Konjac Soft Serve',
      'price': '+\$1.00 Only',
      'image': AppPath.spacialDeal2,
    },
    {
      'name': 'Golden Coconut Jelly Soft Serve',
      'price': '+\$1.20 Only',
      'image': AppPath.spacialDeal1,
    },
    {
      'name': 'Golden Konjac Ball Milk Tea Soft Serve',
      'price': '+\$1.50 Only',
      'image': AppPath.spacialDeal2,
    },
    {
      'name': 'Golden Konjac Ball Milk Tea Soft Serve',
      'price': '+\$2.00 Only',
      'image': AppPath.spacialDeal3,
    },
    {
      'name': 'Jumbo Konjac Jelly Soft Serve',
      'price': '+\$1.50 Only',
      'image': AppPath.spacialDeal2,
    },
    {
      'name': 'Golden Jumbo Milk Tea Soft Serve',
      'price': '+\$1.80 Only',
      'image': AppPath.spacialDeal3,
    },
    {
      'name': 'Bubble Milk Tea Soft Serve',
      'price': '+\$1.00 Only',
      'image': AppPath.koichip,
    },
    {
      'name': 'Golden Bubble Soft Serve',
      'price': '+\$2.00 Only',
      'image': AppPath.spacialDeal2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 412.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.neutral100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.neutral200, width: 2.w),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return SpecialDealProductItem(
            name: product['name']!,
            price: product['price']!,
            image: product['image']!,
          );
        },
      ),
    );
  }
}
