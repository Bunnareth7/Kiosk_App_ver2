import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutSummary extends GetView<CheckoutController> {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.neutral100,
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              'Summary',
              style: AppTextStyle.body2_600.copyWith(
                color: AppColor.neutral800,
              ),
            ),
          ),

          StreamBuilder<List<CartItem>>(
            stream: controller.cartItems,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Something went wrong',
                    style: AppTextStyle.body3_400.copyWith(
                      color: AppColor.neutral500,
                    ),
                  ),
                );
              }

              final items = snapshot.data ?? [];

              if (items.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Your cart is empty',
                    style: AppTextStyle.body3_400.copyWith(
                      color: AppColor.neutral500,
                    ),
                  ),
                );
              }

              return Column(
                children: items.map((item) {
                  return CheckoutProductItem(
                    name: item.productName,
                    quantity: item.quantity,
                    price: item.price,
                    image: item.image,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  final String name;
  final int quantity;
  final double price;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Text(
            '$quantity x',
            style: AppTextStyle.body3_400,
          ),

          12.horizontalSpace,

          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: AppColor.neutral50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: image != null && image!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(image!, fit: BoxFit.contain),
                  )
                : Icon(
                    Icons.local_drink_outlined,
                    size: 26.sp,
                    color: AppColor.neutral400,
                  ),
          ),

          12.horizontalSpace,

          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body3_500,
            ),
          ),

          12.horizontalSpace,

          Text(
            '\$${(price * quantity).toStringAsFixed(2)}',
            style: AppTextStyle.body3_500.copyWith(color: AppColor.neutral800),
          ),
        ],
      ),
    );
  }
}
