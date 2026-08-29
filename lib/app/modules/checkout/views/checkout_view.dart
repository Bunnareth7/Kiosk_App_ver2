import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/checkout/widgets/checkout_tip.dart';
import 'package:kiosk_app/app/modules/payment_success/views/payment_success_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import '../controllers/checkout_controller.dart';
import '../widgets/checkout_header.dart';
import '../widgets/checkout_summary.dart';
import '../widgets/checkout_price_summary.dart';
import '../widgets/checkout_remark.dart';
import '../widgets/checkout_payment.dart';
import '../widgets/checkout_bottom_bar.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  static void open() => Get.toNamed(Routes.CHECKOUT);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral200,
      body: Column(
        children: [
          const CheckoutHeader(),

          6.verticalSpace,

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CheckoutSummary(),

                  6.verticalSpace,

                  StreamBuilder<double>(
                    stream: controller.subtotal,
                    builder: (context, snapshot) {
                      final subtotal = snapshot.data ?? 0.0;
                      return CheckoutPriceSummary(
                        subtotal: subtotal,
                        discount: controller.discount.value,
                        serviceCharge: controller.serviceCharge.value,
                        vat: controller.vat.value,
                      );
                    },
                  ),
                  6.verticalSpace,

                  const CheckoutTipSection(),

                  6.verticalSpace,

                  CheckoutRemark(
                    remark: controller.remark.value,
                    onTap: controller.openRemark,
                  ),

                  6.verticalSpace,

                  const CheckoutPayment(),

                  6.verticalSpace,
                ],
              ),
            ),
          ),
          Obx(
            () => CheckoutBottomBar(
              total: controller.total.value,
              onCheckout: () {
                PaymentSuccessView.open(total: controller.total.value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
