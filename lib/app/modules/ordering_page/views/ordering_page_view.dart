import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/ordering_page/widgets/button_section.dart';
import 'package:kiosk_app/app/modules/ordering_page/widgets/image_slider.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';

class OrderingView extends StatefulWidget {
  const OrderingView({super.key});
  static void open() => Get.toNamed(Routes.START_ORDER);
  @override
  State<OrderingView> createState() => _OrderingViewState();
}

class _OrderingViewState extends State<OrderingView> {
  final List<String> imageList = [
    AppPath.startScreen,
    AppPath.promo2,
    AppPath.promo3,
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ImageSlider(
              imageList: imageList,
              currentIndex: _currentIndex,
              onPageChanged: (index) => setState(() => _currentIndex = index),
            ),
            12.verticalSpace,
            Expanded(child: const BottomSection()),
            12.verticalSpace,
          ],
        ),
      ),
    );
  }
}