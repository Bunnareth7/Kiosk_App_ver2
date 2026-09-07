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

  static const _animDuration = Duration(milliseconds: 150);
  static const double _iconBaseSize = 18;
  static const double _selectedScale = 1.15;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 83.w,
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => 20.verticalSpace,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategory.value == index;

            final baseStyle = AppTextStyle.body4_500;
            final textStyle = baseStyle.copyWith(
              color: isSelected ? AppColor.mainprimarykoi : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
            );

            return AnimInkWell(
              onTap: () => controller.selectedCategory.value = index,
              child: AnimatedContainer(
                duration: _animDuration,
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
                  horizontal: AppDecoration.paddingS8,
                ),
                child: Column(
                  children: [
                    AnimatedScale(
                      scale: isSelected ? _selectedScale : 1.0,
                      duration: _animDuration,
                      child: _CategoryIcon(
                        assetPath: categories[index].iconAsset,
                        size: _iconBaseSize.w,
                      ),
                    ),
                    10.verticalSpace,
                    AnimatedDefaultTextStyle(
                      duration: _animDuration,
                      style: textStyle,
                      textAlign: TextAlign.center,
                      child: Text(categories[index].label),
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
  const _CategoryIcon({required this.assetPath, required this.size});

  final String assetPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        height: size,
        width: size,
        placeholderBuilder: (context) =>
            Container(height: size, width: size, color: Colors.grey[200]),
      );
    }

    return Image.asset(
      assetPath,
      height: size,
      width: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Container(height: size, width: size, color: Colors.grey[200]),
    );
  }
}
