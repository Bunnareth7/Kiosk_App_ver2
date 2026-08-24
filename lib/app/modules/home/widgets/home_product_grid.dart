import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'home_product_card.dart';

class HomeProductGrid extends StatelessWidget {
  const HomeProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDecoration.paddingM10),
      child: Container(
        width: 267.w,
        padding: EdgeInsets.all(AppDecoration.paddingM10),
        decoration: BoxDecoration(
          color: AppColor.neutral100,
          borderRadius: BorderRadius.circular(AppDecoration.largeRadius16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColor.neutral800.withOpacity(0.04),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppDecoration.paddingM10,
                top: AppDecoration.paddingM10,
                bottom: AppDecoration.paddingM10,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppPath.iconKio6, width: 20.w, height: 20.w),
                  6.horizontalSpace,
                  Text(
                    'BEST SELLERS',
                    style: AppTextStyle.body2_600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: sampleProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: AppDecoration.paddingM12,
                  crossAxisSpacing: AppDecoration.paddingM12,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) =>
                    HomeProductCard(product: sampleProducts[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
