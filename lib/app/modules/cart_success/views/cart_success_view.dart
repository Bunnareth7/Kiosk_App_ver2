import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/spacial_deal_screen/views/spacial_deal_screen_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CartSuccessView extends StatefulWidget {
  const CartSuccessView({super.key});

  static void open({required double subtotal, required int quantity}) {
    Get.toNamed(
      Routes.CART_SUCCESS,
      arguments: {'subtotal': subtotal, 'quantity': quantity},
    );
  }

  @override
  State<CartSuccessView> createState() => _CartSuccessViewState();
}

class _CartSuccessViewState extends State<CartSuccessView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        SpacialDealScreenView.open();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map?;
    final subtotal = arguments?['subtotal'] ?? 0.0;

    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60.w,
              height: 60.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      AppPath.shoppingCart,
                      width: 60.w,
                      height: 60.w,
                    ),
                  ),
                  Positioned(
                    right: -19,
                    top: -19,
                    child: Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.neutral100,
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: ClipOval(
                        child: Image.asset(AppPath.checkGif, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Text('Item added to Cart!', style: AppTextStyle.body2_700),
            4.verticalSpace,
            Text(
              'Added successfully',
              style: AppTextStyle.body4_400.copyWith(
                color: AppColor.neutral500,
              ),
            ),
            12.verticalSpace,
            Text(
              '\$${subtotal.toStringAsFixed(2)}',
              style: AppTextStyle.body3_600,
            ),
          ],
        ),
      ),
    );
  }
}
