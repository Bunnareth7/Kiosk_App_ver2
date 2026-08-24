import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/modules/cart_success/views/cart_success_view.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';
// Add this import

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({
    super.key,
    required this.subtotal,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final double subtotal;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDecoration.paddingL16),
      decoration: BoxDecoration(
        color: AppColor.neutral100,
        border: Border(top: BorderSide(color: AppColor.neutral200)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: AppTextStyle.body2_500.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),
                Text(
                  '\$${subtotal.toStringAsFixed(2)}',
                  style: AppTextStyle.body2_500.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              children: [
                QuantityStepper(
                  quantity: quantity,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                ),
                12.verticalSpace,
                Expanded(
                  child: AnimInkWell(
                    onTap: () {
                      CartSuccessView.open(
                        subtotal: subtotal,
                        quantity: quantity,
                      );
                    },
                    child: SizedBox(
                      height: 40.h,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.mainprimarykoi,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'ADD TO CART',
                            style: AppTextStyle.body3_600.copyWith(
                              color: AppColor.neutral100,
                            ),
                          ),
                        ),
                      ),
                    ),
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

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onDecrement,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Icon(Icons.remove, size: 24, color: AppColor.neutral500),
          ),
        ),
        SizedBox(
          width: 24.w,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: AppTextStyle.body2_500,
          ),
        ),
        InkWell(
          onTap: onIncrement,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Icon(Icons.add, size: 24, color: AppColor.mainprimarykoi),
          ),
        ),
      ],
    );
  }
}
