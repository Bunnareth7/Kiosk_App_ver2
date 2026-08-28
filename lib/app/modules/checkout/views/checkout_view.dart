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
                    builder: (context, subtotalSnapshot) {
                      final subtotal = subtotalSnapshot.data ?? 0.0;

                      return StreamBuilder<double>(
                        stream: controller.tip,
                        builder: (context, tipSnapshot) {
                          return CheckoutPriceSummary(
                            subtotal: subtotal,
                            discount: 0.0,
                            serviceCharge: 1.00,
                            vat: 10,
                          );
                        },
                      );
                    },
                  ),

                  6.verticalSpace,

                  CheckoutTipSection(controller: controller),

                  6.verticalSpace,

                  CheckoutRemark(
                    onTap: () {
                      // Add remark later
                    },
                  ),

                  6.verticalSpace,

                  const CheckoutPayment(),

                  6.verticalSpace,
                ],
              ),
            ),
          ),
          StreamBuilder<double>(
            stream: controller.total,
            builder: (context, snapshot) {
              final total = snapshot.data ?? 0.0;

              return CheckoutBottomBar(
                total: total,
                onCheckout: () {
                  PaymentSuccessView.open(total: total);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
