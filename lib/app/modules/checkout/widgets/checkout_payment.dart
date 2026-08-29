import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class CheckoutPayment extends GetView<CheckoutController> {
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
              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.koi,
                    title: 'KOI Wallet',
                    isSelected: controller.selectedPaymentIndex.value == 0,
                    onTap: () => controller.selectPayment(0),
                  ),
                ),
              ),

              8.horizontalSpace,

              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.khqrIcon,
                    title: 'KHQR',
                    isSelected: controller.selectedPaymentIndex.value == 1,
                    onTap: () => controller.selectPayment(1),
                  ),
                ),
              ),

              8.horizontalSpace,

              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.creditCard,
                    title: 'Credit Card',
                    isSelected: controller.selectedPaymentIndex.value == 2,
                    onTap: () => controller.selectPayment(2),
                  ),
                ),
              ),
            ],
          ),

          8.verticalSpace,

          Row(
            children: [
              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.cash,
                    title: 'Cash',
                    isSelected: controller.selectedPaymentIndex.value == 3,
                    onTap: () => controller.selectPayment(3),
                  ),
                ),
              ),

              8.horizontalSpace,

              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.alipay,
                    title: 'AliPay',
                    isSelected: controller.selectedPaymentIndex.value == 4,
                    onTap: () => controller.selectPayment(4),
                  ),
                ),
              ),

              8.horizontalSpace,

              Expanded(
                child: Obx(
                  () => _PaymentMethod(
                    iconPath: AppPath.wepay,
                    title: 'WeChat Pay',
                    isSelected: controller.selectedPaymentIndex.value == 5,
                    onTap: () => controller.selectPayment(5),
                  ),
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
  const _PaymentMethod({
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 108.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primarykoi200 : AppColor.neutral200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath.endsWith('.svg'))
              SvgPicture.asset(iconPath, height: 22.sp, width: 22.sp)
            else
              Image.asset(iconPath, height: 22.sp, width: 22.sp),

            5.horizontalSpace,

            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.body4_500.copyWith(
                  color: isSelected
                      ? AppColor.mainprimarykoi
                      : AppColor.neutral500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
