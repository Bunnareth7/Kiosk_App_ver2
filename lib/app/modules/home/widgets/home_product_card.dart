import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';
import 'package:kiosk_app/app/modules/order_detail/views/order_detail_view.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: () => OrderDetailView.open(product),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          AppDecoration.paddingM10,
          AppDecoration.paddingM10,
          AppDecoration.paddingM10,
          0,
        ),
        decoration: BoxDecoration(
         
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 61.w,
              height: 101.w,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColor.neutral500,
                  child: const Icon(Icons.image, color: AppColor.neutral500),
                ),
              ),
            ),
            8.verticalSpace,
            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body3_500,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: AppDecoration.paddingS4,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyle.body3_500.copyWith(
                    color: AppColor.error500,
                  ),
                ),
                if (product.hasDiscount)
                  Text(
                    '\$${product.originalPrice!.toStringAsFixed(2)}',
                    style: AppTextStyle.body3_500.copyWith(
                      color: AppColor.neutral500,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColor.neutral500,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}