import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutTipSection extends GetView<CheckoutController> {
  const CheckoutTipSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.neutral100,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Tips',
            style: AppTextStyle.body2_600.copyWith(
              color: AppColor.neutral800,
            ),
          ),
          12.verticalSpace,
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: _TipItem(
                    title: 'No Tip',
                    amount: '',
                    isSelected: controller.selectedTipIndex.value == 0,
                    onTap: () => controller.selectTip(0),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: _TipItem(
                    title: '10%',
                    amount: '',
                    isSelected: controller.selectedTipIndex.value == 1,
                    onTap: () => controller.selectTip(1),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: _TipItem(
                    title: '15%',
                    amount: '',
                    isSelected: controller.selectedTipIndex.value == 2,
                    onTap: () => controller.selectTip(2),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: _TipItem(
                    title: '20%',
                    amount: '',
                    isSelected: controller.selectedTipIndex.value == 3,
                    onTap: () => controller.selectTip(3),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: _TipItem(
                    title: 'Custom',
                    amount: '',
                    isSelected: controller.selectedTipIndex.value == 4,
                    onTap: () => controller.selectTip(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipItem extends StatelessWidget {
  const _TipItem({
    required this.title,
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String amount;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primarykoi200
              : AppColor.neutral50,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.body4_500.copyWith(
                color: isSelected
                    ? AppColor.mainprimarykoi
                    : AppColor.neutral500,
              ),
            ),
            if (amount.isNotEmpty)
              Text(
                amount,
                style: AppTextStyle.body4_500.copyWith(
                  color: isSelected
                      ? AppColor.mainprimarykoi
                      : AppColor.neutral800,
                ),
              ),
          ],
        ),
      ),
    );
  }
}