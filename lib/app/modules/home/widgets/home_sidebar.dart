import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';
import '../controllers/home_controller.dart';
import 'home_category.dart';

class HomeSidebar extends StatelessWidget {
  const HomeSidebar({
    super.key,
    required this.controller,
    required this.categories,
  });

  final HomeController controller;
  final List<HomeCategory> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategory.value == index;
            return AnimInkWell(
              onTap: () => controller.selectedCategory.value = index,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: isSelected
                          ? AppColor.mainprimarykoi
                          : Colors.transparent,
                      width: 3.w,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: AppDecoration.paddingM12,
                  horizontal: AppDecoration.paddingS8,
                ),
                child: Column(
                  children: [
                    _CategoryIcon(assetPath: categories[index].iconAsset),
                    4.verticalSpace,
                    Text(
                      categories[index].label,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body3_600.copyWith(
                        color: isSelected
                            ? AppColor.mainprimarykoi
                            : Colors.grey,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

/// Handles both .svg and .png category icons.
class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        height: 18.w,
        width: 18.w,
        placeholderBuilder: (context) =>
            Container(height: 18.w, width: 18.w, color: Colors.grey[200]),
      );
    }

    return Image.asset(
      assetPath,
      height: 18.w,
      width: 18.w,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Container(height: 18.w, width: 18.w, color: Colors.grey[200]),
    );
  }
}
