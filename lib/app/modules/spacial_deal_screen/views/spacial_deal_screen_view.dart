import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';

import '../widgets/special_deal_header.dart';
import '../widgets/special_deal_grid.dart';
import '../widgets/special_deal_button.dart';

class SpacialDealScreenView extends StatelessWidget {
  const SpacialDealScreenView({super.key});

  static void open() => Get.toNamed(Routes.SPACIAL_DEAL_SCREEN);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpecialDealHeader(),

              0.verticalSpace,

              const SpecialDealGrid(),

              16.verticalSpace,

              const SpecialDealButton(),
              
            ],
          ),
        ),
      ),
    );
  }
}
